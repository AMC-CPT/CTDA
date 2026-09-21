"""자료에 근거한 그림들. 모두 원자료(공개자료 또는 저자 보유 자료)로부터 새로 그린다."""
import os
import numpy as np
import matplotlib.pyplot as plt
from mkfig_common import (setup, save, despine, DATA,
                          INK, MUTED, GRID, ACCENT, ACCENT2, ACCENT3, FILL)

setup()
print("[data figures]")

# ---------------------------------------------------------------- 한국 사망률 추이
# 출처: 국가데이터처(구 통계청) 사망원인통계 2008–2024년 확정치,
#       2025년은 출생·사망통계(잠정, 2026-02-25 공표).
# 2025년 연령표준화 사망률 확정치는 2025년 사망원인통계 공표 시점에 확정된다.
YEAR = np.arange(2008, 2025)
DEATHS = np.array([246113, 246942, 255405, 257396, 267221, 266257, 267692,
                   275895, 280827, 285534, 298820, 295110, 304948, 317680,
                   372939, 352511, 358569])
CRUDE = np.array([498.2, 497.3, 512.0, 513.6, 530.8, 526.6, 527.3,
                  541.5, 549.4, 557.3, 582.5, 574.8, 593.9, 618.9,
                  727.6, 689.2, 702.6])
ASMR = np.array([438.9, 420.5, 414.3, 398.4, 392.2, 372.0, 355.7,
                 347.6, 337.2, 324.3, 322.6, 305.4, 300.0, 298.3,
                 327.3, 299.7, 294.6])
Y_PROV, DEATHS_PROV, CRUDE_PROV = 2025, 363400, 710.0   # 잠정치

fig, axes = plt.subplots(1, 3, figsize=(8.4, 3.5))
panels = [
    (DEATHS / 1000, "사망자 수 (천 명)", "(가) 사망자 수", ACCENT,
     (230, 390), DEATHS_PROV / 1000),
    (CRUDE, "조사망률 (10만 명당)", "(나) 조사망률", ACCENT2,
     (450, 770), CRUDE_PROV),
    (ASMR, "연령표준화 사망률 (10만 명당)", "(다) 연령표준화 사망률", ACCENT3,
     (280, 460), None),
]
for ax, (y, ylab, title, col, ylim, prov) in zip(axes, panels):
    # COVID-19 유행기(2020–2022) 음영
    ax.axvspan(2019.5, 2022.5, color="#f0f0f0", zorder=0)
    ax.plot(YEAR, y, marker="o", ms=4.2, lw=1.8, color=col, mfc="white", mew=1.4,
            zorder=3, label="확정치")
    if prov is not None:      # 잠정치는 속 빈 표식과 점선으로 구분한다
        ax.plot([YEAR[-1], Y_PROV], [y[-1], prov], lw=1.4, ls=(0, (3, 2)),
                color=col, zorder=2)
        ax.plot([Y_PROV], [prov], marker="o", ms=5.2, color=col, mfc="none",
                mew=1.4, zorder=3, label="잠정치")
        ax.legend(frameon=False, fontsize=9.6, loc="lower right",
                  handlelength=1.6, borderpad=0.2)
    ax.set_title(title, pad=9)
    ax.set_ylabel(ylab, fontsize=10.2)
    ax.set_xlabel("연도")
    ax.set_ylim(*ylim)
    ax.set_xlim(2007, 2026)
    ax.set_xticks([2008, 2012, 2016, 2020, 2024])
    ax.yaxis.grid(True, color=GRID, lw=0.7)
    ax.set_axisbelow(True)
    despine(ax)

# 2022년 연령표준화 사망률의 돌출을 표시한다
ax = axes[2]
ax.annotate("2022년 327.3\n(전년 대비 +29.0)", xy=(2022, 327.3), xytext=(2016.2, 400),
            fontsize=9.8, color=ACCENT2, ha="center",
            arrowprops=dict(arrowstyle="->", color=ACCENT2, lw=1.0))
ax.plot([2022], [327.3], marker="o", ms=6.5, color=ACCENT2, zorder=5)
for a in axes:
    a.text(2021.0, 0.965, "COVID-19", transform=a.get_xaxis_transform(),
           ha="center", va="top", fontsize=9.6, color=MUTED)
#  판면 폭에 맞추어 좁아졌으므로 y축 이름이 옆 패널을 침범하지 않도록 배치를 정리한다.
fig.tight_layout()
save(fig, "fig-korea-mortality-2008-2025")

# x-y-z 그림은 R 로 옮겼다: R/snippets/qdm-xyz.R (책의 freeze 파이프라인)

# ---------------------------------------------------------------- 앤스컴의 사중주
# Anscombe(1973)의 자료값. 널리 공표된 수치자료이며 그림은 새로 그렸다.
AX1 = [10, 8, 13, 9, 11, 14, 6, 4, 12, 7, 5]
A = {
    1: (AX1, [8.04, 6.95, 7.58, 8.81, 8.33, 9.96, 7.24, 4.26, 10.84, 4.82, 5.68]),
    2: (AX1, [9.14, 8.14, 8.74, 8.77, 9.26, 8.10, 6.13, 3.10, 9.13, 7.26, 4.74]),
    3: (AX1, [7.46, 6.77, 12.74, 7.11, 7.81, 8.84, 6.08, 5.39, 8.15, 6.42, 5.73]),
    4: ([8, 8, 8, 8, 8, 8, 8, 19, 8, 8, 8],
        [6.58, 5.76, 7.71, 8.84, 8.47, 7.04, 5.25, 12.50, 5.56, 7.91, 6.89]),
}
fig, axes = plt.subplots(2, 2, figsize=(6.8, 5.8))
for k, ax in zip([1, 2, 3, 4], axes.ravel()):
    ax_, ay = np.array(A[k][0], float), np.array(A[k][1], float)
    ax.scatter(ax_, ay, s=46, color=ACCENT2, edgecolor=INK, lw=0.7, zorder=3)
    xs = np.linspace(3, 20, 40)
    ax.plot(xs, 3.0 + 0.5 * xs, color=ACCENT, lw=1.6, zorder=2)
    ax.set_xlim(2, 20); ax.set_ylim(2, 14)
    ax.set_title(f"자료 {k}", pad=7)
    ax.set_xlabel("x"); ax.set_ylabel("y")
    ax.grid(True, color=GRID, lw=0.6)
    ax.set_axisbelow(True)
    despine(ax)
fig.suptitle("네 자료의 평균·분산·상관계수·회귀직선·결정계수는 사실상 같다", y=0.985, fontsize=12.2)
fig.tight_layout(rect=[0, 0, 1, 0.965])
save(fig, "fig-anscombe-quartet")

# ---------------------------------------------------------------- 심슨의 역설
rng = np.random.default_rng(7)
fig, axes = plt.subplots(1, 2, figsize=(7.6, 3.7))
centers = [(2.0, 10.5), (4.2, 8.6), (6.4, 6.9), (8.6, 5.1), (10.6, 3.4)]
groups = []
for cx, cy in centers:
    n = 70
    gx = rng.normal(cx, 0.62, n)
    gy = cy + 0.55 * (gx - cx) + rng.normal(0, 0.55, n)
    groups.append((gx, gy))
allx = np.concatenate([g[0] for g in groups])
ally = np.concatenate([g[1] for g in groups])

ax = axes[0]
ax.scatter(allx, ally, s=12, color=MUTED, alpha=0.75, lw=0)
m, c = np.polyfit(allx, ally, 1)
xs = np.linspace(allx.min(), allx.max(), 40)
ax.plot(xs, m * xs + c, color=ACCENT2, lw=2.2)
ax.set_title(f"(가) 전체를 한 덩어리로 보면: r = {np.corrcoef(allx, ally)[0,1]:+.2f}", pad=9)

ax = axes[1]
rs = []
for i, (gx, gy) in enumerate(groups):
    ax.scatter(gx, gy, s=12, alpha=0.8, lw=0,
               color=[ACCENT, ACCENT2, "#2e7d32", "#7b1fa2", "#00695c"][i])
    mm, cc = np.polyfit(gx, gy, 1)
    xr = np.linspace(gx.min(), gx.max(), 20)
    ax.plot(xr, mm * xr + cc, color=INK, lw=1.5)
    rs.append(np.corrcoef(gx, gy)[0, 1])
ax.set_title(f"(나) 층으로 나누면: 각 층에서 r = {np.mean(rs):+.2f}", pad=9)

for ax in axes:
    ax.set_xlabel("x"); ax.set_ylabel("y")
    ax.grid(True, color=GRID, lw=0.6); ax.set_axisbelow(True)
    despine(ax)
fig.tight_layout()
save(fig, "fig-simpsons-paradox")

# ---------------------------------------------------------------- LogP vs 생체이용률 (실제)
# 자료는 data/LogP-F.csv 하나만을 진실의 원천으로 삼는다.
# 같은 파일을 R 스니펫(R/snippets/qdm-logp.R)도 읽으므로 본문 수치와 어긋날 수 없다.
LOGP_CSV = os.path.join(DATA, "LogP-F.csv")
_d = np.genfromtxt(LOGP_CSV, delimiter=",", names=True, dtype=float)
lp, ba = np.asarray(_d["LogP"], float), np.asarray(_d["F"], float)
r_lp = np.corrcoef(lp, ba)[0, 1]

fig, ax = plt.subplots(figsize=(6.6, 4.4))
ax.scatter(lp, ba, s=50, color=ACCENT, edgecolor=INK, lw=0.7, alpha=0.85, zorder=3)
ax.axvspan(0, 3, color="#eef2f7", zorder=0)
#  '<' 는 한글 글꼴에서 각괄호로 인쇄되므로 mathtext 로 조판한다.
ax.text(1.5, 1.09, "교과서가 말하는 최적 구간 " r"($0 < \mathrm{LogP} < 3$)",
        ha="center", fontsize=10.4, color=MUTED)
m, c = np.polyfit(lp, ba, 1)
xs = np.linspace(-3, 8.5, 30)
ax.plot(xs, m * xs + c, color=ACCENT2, lw=1.7, ls="--", zorder=2)
ax.set_xlabel("LogP")
ax.set_ylabel("경구 생체이용률 (F)")
ax.set_xlim(-3.4, 8.7); ax.set_ylim(-0.03, 1.16)
ax.text(0.975, 0.055, f"n = {len(lp)},  r = {r_lp:+.2f}", transform=ax.transAxes,
        ha="right", fontsize=10.5, color=ACCENT2, fontweight="bold")
ax.grid(True, color=GRID, lw=0.6); ax.set_axisbelow(True)
despine(ax)
save(fig, "fig-logp-vs-bioavailability-reality")
print(f"  (참고) LogP-BA 상관계수 r = {r_lp:.3f}, n = {len(lp)}")

# ---------------------------------------------------------------- IND to Market
stages = ["제1상", "제2상", "제3상", "NDA", "시판"]
xpos = np.arange(5)
scen = [
    ("최악 (Worst)",  [500, 500, 500, 500, 36], ACCENT3, "-",  "s"),
    ("현재 (Current)", [500, 300,  90,  45, 36], ACCENT,  "-",  "o"),
    ("개선 (Improved)", [500, 200,  90,  45, 36], ACCENT2, "-",  "^"),
    ("이상 (Ideal)",   [500,  36,  36,  36, 36], MUTED,   "--", "D"),
]
fig, ax = plt.subplots(figsize=(7.0, 4.4))
for lab, v, col, ls, mk in scen:
    ax.plot(xpos, v, marker=mk, ms=5.5, lw=2.0, ls=ls, color=col,
            label=lab, mfc="white", mew=1.5)
ax.set_xticks(xpos); ax.set_xticklabels(stages)
ax.set_ylabel("화합물 수")
ax.set_ylim(-15, 545)
ax.annotate("36개\n(IND 진입 화합물의 5~8%)", xy=(4, 36), xytext=(3.05, 150),
            fontsize=10.2, color=INK, ha="center",
            arrowprops=dict(arrowstyle="->", color=INK, lw=0.9))
ax.annotate("", xy=(1, 200), xytext=(1, 300),
            arrowprops=dict(arrowstyle="<->", color=ACCENT2, lw=1.6))
#  x=1.08 에 두면 500→300 으로 내려오는 Current 선이 두 줄을 관통한다.
#  제2상 눈금 오른쪽의 빈자리(선 위쪽)로 옮긴다.
ax.text(1.15, 355, "제2상에 넘기는\n화합물 100개 감소", fontsize=10.2, color=ACCENT2,
        va="center", ha="left")
ax.legend(frameon=False, loc="upper right", fontsize=10.5)
ax.yaxis.grid(True, color=GRID, lw=0.7); ax.set_axisbelow(True)
despine(ax)
save(fig, "fig-ind-to-market")

print("[data figures] done")
