"""본문이 요구하지만 원 발표자료에 없던 그림 2종. 전부 새로 설계·작도한다."""
import numpy as np
import matplotlib.pyplot as plt
from mkfig_common import (setup, save, despine, INK, MUTED, GRID,
                          ACCENT, ACCENT2, ACCENT3, FILL)

setup()
print("[extra figures]")

# ================================================= 1. 용량-반응 vs 농도-효과
# 같은 반응 자료를 (가) 투여용량 (나) 실제 노출에 대해 그린다.
# 개체간 청소율 변이가 용량과 노출 사이에 끼어들기 때문에 (가)가 더 흩어진다.
rng = np.random.default_rng(11)
doses = np.array([10, 30, 100, 300], float)
n_per = 18
EMAX, EC50 = 100.0, 50.0

dose_col, auc_col, resp_col = [], [], []
for d in doses:
    CL = np.exp(rng.normal(0, 0.55, n_per))       # 개체간 청소율 변이 (CV ≈ 58%)
    auc = d / CL
    resp = EMAX * auc / (EC50 + auc) + rng.normal(0, 4.5, n_per)
    dose_col.append(np.full(n_per, d)); auc_col.append(auc); resp_col.append(resp)
dose = np.concatenate(dose_col); auc = np.concatenate(auc_col); resp = np.concatenate(resp_col)


def r2_on_log(x, y):
    lx = np.log(x)
    b, a = np.polyfit(lx, y, 1)
    yhat = a + b * lx
    return 1 - np.sum((y - yhat) ** 2) / np.sum((y - y.mean()) ** 2)


fig, axes = plt.subplots(1, 2, figsize=(7.6, 3.9), sharey=True)

ax = axes[0]
jit = np.exp(rng.normal(0, 0.045, len(dose)))
ax.semilogx(dose * jit, resp, "o", ms=5, mfc="none", mec=ACCENT, mew=1.0, alpha=0.8)
for d in doses:
    m = dose == d
    ax.plot([d * 0.80, d * 1.25], [resp[m].mean()] * 2, color=ACCENT2, lw=2.6, zorder=5)
ax.set_xlabel("투여 용량 (mg, 로그 눈금)")
ax.set_ylabel("반응")
ax.set_title("(가) 용량 – 반응", pad=9)
ax.text(0.04, 0.94, f"$R^2$ = {r2_on_log(dose, resp):.2f}", transform=ax.transAxes,
        fontsize=11, color=ACCENT2, fontweight="bold", va="top")
#  좌상단에 두면 300 mg 군의 평균선(굵은 선)이 첫 줄을 관통하므로 오른쪽 아래 빈자리로 옮긴다.
ax.text(0.30, 0.27, "용량군 평균(굵은 선)은 단조 증가하지만\n같은 용량 안에서 반응이 크게 흩어진다",
        transform=ax.transAxes, fontsize=9.8, color=MUTED, va="top", linespacing=1.5,
        bbox=dict(facecolor="white", edgecolor="none", alpha=0.92, pad=1.5))

ax = axes[1]
ax.semilogx(auc, resp, "o", ms=5, mfc="none", mec=ACCENT, mew=1.0, alpha=0.8)
xs = np.logspace(np.log10(auc.min()), np.log10(auc.max()), 200)
ax.plot(xs, EMAX * xs / (EC50 + xs), color=ACCENT2, lw=2.4, zorder=5)
ax.set_xlabel("실제 노출 AUC (임의 단위, 로그 눈금)")
ax.set_title("(나) 노출 – 반응", pad=9)
ax.text(0.04, 0.94, f"$R^2$ = {r2_on_log(auc, resp):.2f}", transform=ax.transAxes,
        fontsize=11, color=ACCENT2, fontweight="bold", va="top")
ax.text(0.04, 0.845, "같은 자료인데도 관계가 뚜렷해지고\nEmax 곡선이 그대로 드러난다",
        transform=ax.transAxes, fontsize=9.8, color=MUTED, va="top", linespacing=1.5)

for ax in axes:
    ax.grid(True, color=GRID, lw=0.6); ax.set_axisbelow(True); despine(ax)
fig.tight_layout()
save(fig, "fig-dose-response-vs-exposure-response")
print(f"  R2(용량) = {r2_on_log(dose, resp):.3f} / R2(노출) = {r2_on_log(auc, resp):.3f}")

# ================================================= 2. 가능도함수와 1/15 가능도구간
# 이항자료 n = 10, x = 2 의 가능도. 비대칭이며, 대칭 Wald 신뢰구간은 음수까지 내려간다.
n, x = 10, 2
phat = x / n


def _loglik(pp):
    return x * np.log(pp) + (n - x) * np.log(1 - pp)


LMAX = _loglik(phat)                   # 최대가능도의 로그 (격자값이 아닌 정확한 값)
p = np.linspace(1e-4, 0.75, 4000)
L = np.exp(_loglik(p) - LMAX)          # 상대가능도 L(p)/L(phat)

thr = 1 / 15
inside = L >= thr


def _root(a, b):
    """상대가능도 = 1/15 인 경계를 이분법으로 정확히 찾는다.
    (R/snippets/qdm-li.R 의 uniroot 결과와 자릿수까지 일치시키기 위한 것이다.)"""
    def g(pp):
        return np.exp(_loglik(pp) - LMAX) - thr
    for _ in range(200):
        m = 0.5 * (a + b)
        if g(a) * g(m) <= 0:
            b = m
        else:
            a = m
    return 0.5 * (a + b)


lo = _root(1e-8, phat)
hi = _root(phat, 1 - 1e-8)

se = np.sqrt(phat * (1 - phat) / n)
w_lo, w_hi = phat - 1.96 * se, phat + 1.96 * se

fig, ax = plt.subplots(figsize=(7.0, 4.5))
ax.plot(p, L, color=ACCENT, lw=2.4, zorder=4)
ax.fill_between(p, 0, L, where=inside, color=FILL, zorder=1)
ax.axhline(thr, color=ACCENT2, lw=1.3, ls="--", zorder=3)
ax.text(0.735, thr + 0.018, "최대가능도의 1/15", ha="right", fontsize=10.2, color=ACCENT2)
ax.plot([phat, phat], [0, 1], color=INK, lw=1.2, ls=":", zorder=3)
ax.plot(phat, 1, "o", ms=7, color=INK, zorder=6)
ax.text(phat + 0.012, 1.005, "최대가능도추정값  $\\hat{p}$ = 0.20", fontsize=10.4, color=INK)

for v in (lo, hi):
    ax.plot([v, v], [0, thr], color=ACCENT2, lw=1.2, zorder=3)
ax.annotate("", xy=(lo, -0.075), xytext=(hi, -0.075), annotation_clip=False,
            arrowprops=dict(arrowstyle="<->", color=ACCENT2, lw=1.8))
ax.text((lo + hi) / 2, -0.125, f"가능도구간 ({lo:.4f}, {hi:.4f}): 비대칭",
        ha="center", fontsize=10, color=ACCENT2, clip_on=False)

ax.annotate("", xy=(w_lo, -0.205), xytext=(w_hi, -0.205), annotation_clip=False,
            arrowprops=dict(arrowstyle="<->", color=ACCENT3, lw=1.8))
ax.text((w_lo + w_hi) / 2, -0.255,
        f"대칭 Wald 신뢰구간 ({w_lo:.4f}, {w_hi:.4f}): 아래끝이 음수",
        ha="center", fontsize=10, color=ACCENT3, clip_on=False)
ax.plot([0, 0], [-0.235, -0.175], color=INK, lw=1.2, clip_on=False)
ax.text(0.004, -0.168, "p = 0", fontsize=9.4, color=INK, clip_on=False)

ax.set_xlabel("모수 p", labelpad=54)
ax.set_ylabel("상대 가능도  $L(p)\\,/\\,L(\\hat{p})$")
ax.set_xlim(-0.09, 0.75); ax.set_ylim(0, 1.10)
ax.grid(True, color=GRID, lw=0.6); ax.set_axisbelow(True)
despine(ax)
save(fig, "fig-likelihood-interval")
print(f"  n={n}, x={x}: 1/15 가능도구간 = ({lo:.4f}, {hi:.4f})  |  "
      f"Wald 95% CI = ({w_lo:.4f}, {w_hi:.4f})")

print("[extra figures] done")
