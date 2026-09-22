"""개념도·모식도. 모두 새로 그린 원저작물이며 제3자 도판을 복제하지 않는다."""
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.patches import (FancyBboxPatch, FancyArrowPatch, Ellipse, Circle,
                                Rectangle, Polygon, Wedge)
from mkfig_common import (setup, save as _save_pdf, despine, translate_fig, LANG,
                          INK, MUTED, GRID, ACCENT, ACCENT2, ACCENT3, FILL, FILL2)

setup()
print("[schematic figures]")


_BOXES = []   # (상자, 라벨) 쌍. save() 가 라벨이 상자 안에 들었는지 검사한다.


def box(ax, x, y, w, h, text, fc=FILL, ec=ACCENT, fs=10, tc=INK, r=0.02, lw=1.1, weight="normal"):
    p = FancyBboxPatch((x, y), w, h, boxstyle=f"round,pad=0,rounding_size={r}",
                       fc=fc, ec=ec, lw=lw, zorder=2)
    ax.add_patch(p)
    t = ax.text(x + w / 2, y + h / 2, text, ha="center", va="center",
                fontsize=fs, color=tc, zorder=3, linespacing=1.45, fontweight=weight)
    _BOXES.append((p, t))


def save(fig, name):
    """상자 라벨이 상자 밖으로 나가면 저장하지 않고 예외를 던진다.

    그림 1.1(신약개발 과정 개관)의 3줄 라벨이 상자 위아래로 넘친 채 책에 실린 일이
    있었다(2026-09-16 발견). 글꼴 크기나 줄 수를 바꿀 때 눈으로만 확인하면 같은
    결함이 되풀이되므로, 렌더러가 계산한 실제 글자 상자로 포함 여부를 검사한다.

    영어 라벨은 대체로 한국어보다 길어 같은 상자를 넘치기 쉽다. 영어 모드에서는
    넘친 라벨의 글자 크기를 한 단계씩(0.94배, 최대 8번) 줄여 상자에 맞춘 뒤, 그래도
    넘치면 예외를 던진다. 한국어판은 종전대로 줄이지 않고 바로 예외를 던진다.
    """
    translate_fig(fig)                          # 검사 전에 영어로 바꾼다(한국어 모드는 무동작)
    fig.canvas.draw()
    rend = fig.canvas.get_renderer()
    tol = 0.5                                   # 픽셀

    def fits(p, t):
        pb, tb = p.get_window_extent(rend), t.get_window_extent(rend)
        return not (tb.x0 < pb.x0 - tol or tb.x1 > pb.x1 + tol or
                    tb.y0 < pb.y0 - tol or tb.y1 > pb.y1 + tol)

    if LANG == "en":
        for p, t in _BOXES:
            if p.figure is not fig:
                continue
            for _ in range(8):
                if fits(p, t):
                    break
                t.set_fontsize(t.get_fontsize() * 0.94)
                fig.canvas.draw()
                rend = fig.canvas.get_renderer()

    bad = []
    for p, t in _BOXES:
        if p.figure is not fig:
            continue
        pb, tb = p.get_window_extent(rend), t.get_window_extent(rend)
        if not fits(p, t):
            bad.append("%r: 글자 %s, 상자 %s" % (t.get_text().replace("\n", "/"),
                                              [round(v) for v in tb.extents],
                                              [round(v) for v in pb.extents]))
    _BOXES[:] = [(p, t) for p, t in _BOXES if p.figure is not fig]
    if bad:
        raise RuntimeError("%s: 상자 밖으로 나간 라벨 %d개\n  " % (name, len(bad)) + "\n  ".join(bad))
    _save_pdf(fig, name)


def arrow(ax, p, q, color=INK, lw=1.3, style="-|>", ms=9, ls="-", rad=0.0):
    ax.add_patch(FancyArrowPatch(p, q, arrowstyle=style, mutation_scale=ms,
                                 color=color, lw=lw, linestyle=ls, zorder=4,
                                 connectionstyle=f"arc3,rad={rad}",
                                 shrinkA=2, shrinkB=2))


def blank(figsize, xlim=(0, 100), ylim=(0, 100)):
    fig, ax = plt.subplots(figsize=figsize)
    ax.set_xlim(*xlim); ax.set_ylim(*ylim)
    ax.axis("off")
    return fig, ax


# ============================================================ 1. 관측과 추론의 경계
fig, ax = blank((8.4, 3.6), xlim=(0, 152), ylim=(6, 104))

# --- 왼쪽: 실제로 관측된 것
box(ax, 2, 44, 28, 40,
    "실제로 관측된 것\n\n"
    "· 양 한 마리\n"
    "· 한쪽 옆모습만\n"
    "· 한 장소, 한 시점",
    fc="#f4f6f9", ec=INK, fs=10.4, lw=1.4)
arrow(ax, (30.8, 64), (35.2, 64), color=INK, lw=1.3, ms=10)

X0 = 36.0
stmts = [
    ("남자 1", "호주 양은 검다",                 88, ACCENT2, "모집단 전체로 과잉일반화\n(주장의 범위: 호주의 모든 양)"),
    ("남자 2", "몇몇 호주 양은 검다",             64, ACCENT2, "존재양화로 후퇴\n(주장의 범위: 호주 양의 일부)"),
    ("남자 3", "적어도 한 마리는 검다",           40, ACCENT,  "표본 한 개로 축소\n(주장의 범위: 관측된 그 한 마리)"),
    ("남자 4", "적어도 한 마리는\n한쪽 면이 검다", 18, ACCENT,  "관측된 것만 주장\n(주장의 범위: 관측된 그 한쪽 면)"),
]
rows_y = [84, 64, 44, 24]
for (who, claim, width, col, note), yy in zip(stmts, rows_y):
    #  경계선(BX)이 진술문을 관통하지 않도록 흰 배경을 깐다.
    ax.text(X0, yy + 8.4, f"{who}  |  " + claim.replace("\n", " "),
            ha="left", va="bottom", fontsize=10.8, color=INK, zorder=7,
            bbox=dict(facecolor="white", edgecolor="none", pad=0.8))
    ax.add_patch(FancyBboxPatch((X0, yy - 0.5), width, 8.0,
                                boxstyle="round,pad=0,rounding_size=1.4",
                                fc=plt.matplotlib.colors.to_rgba(col, 0.20),
                                ec=col, lw=1.3, zorder=3))
    ax.text(126, yy + 3.5, note, ha="left", va="center",
            fontsize=9.6, color=col, zorder=5, linespacing=1.5)

# 관측이 실제로 뒷받침하는 경계선
BX = X0 + 18
ax.plot([BX, BX], [18, 97], color=INK, lw=1.5, ls=(0, (5, 3)), zorder=6)
ax.text(BX - 1.5, 98.5, "관측이 뒷받침하는 경계", ha="right", va="bottom",
        fontsize=10.0, color=INK)
ax.annotate("", xy=(124, 14), xytext=(BX, 14),
            arrowprops=dict(arrowstyle="->", color=MUTED, lw=1.1))
ax.text((BX + 124) / 2, 10.5, "관측이 뒷받침하지 못하는 부분", ha="center",
        va="top", fontsize=9.8, color=MUTED)
#  도판 안 안내문은 캡션(ch-qdm)과 keypoint 가 같은 내용을 이미 담고 있어 삭제한다.
#  (판면 폭으로 축소되면 9.6 pt 가 5 pt 로 찍혀 판독되지 않는다.)
save(fig, "fig-observation-vs-inference")

# ============================================================ 2. 세포 신호전달망 개념도
fig, ax = blank((8.0, 4.5))
ax.add_patch(FancyBboxPatch((6, 10), 88, 78, boxstyle="round,pad=0,rounding_size=8",
                            fc="#fbfcfd", ec=ACCENT3, lw=1.4))
ax.add_patch(Ellipse((50, 40), 30, 20, fc=FILL, ec=ACCENT, lw=1.3, zorder=5))
ax.text(50, 40, "유전자 발현", ha="center", va="center", fontsize=11.2,
        color=ACCENT, zorder=6)
recept = [(16, 88), (33, 88), (50, 88), (67, 88), (84, 88)]
for i, (rx, ry) in enumerate(recept):
    ax.add_patch(Rectangle((rx - 3, ry - 4), 6, 8, fc=ACCENT2, ec=INK, lw=0.8, zorder=5))
    ax.text(rx, ry + 7, f"수용체 {i+1}", ha="center", fontsize=9.6, color=MUTED)
R = 4.3          # 노드 반지름 (데이터 단위)
EA, EB = 15.0, 10.0   # 유전자 발현 타원의 반축


def edge(a, b, ra, rb, color=ACCENT3, lw=1.0, ms=11):
    """데이터 좌표에서 시작·끝을 각각 ra, rb 만큼 물러나게 하여 화살촉이 보이도록 한다."""
    ax_, ay_ = a
    bx_, by_ = b
    dx, dy = bx_ - ax_, by_ - ay_
    L = np.hypot(dx, dy)
    if L < 1e-9:
        return
    ux, uy = dx / L, dy / L
    ax.add_patch(FancyArrowPatch((ax_ + ux * ra, ay_ + uy * ra),
                                 (bx_ - ux * rb, by_ - uy * rb),
                                 arrowstyle="-|>", mutation_scale=ms,
                                 color=color, lw=lw, zorder=4,
                                 shrinkA=0, shrinkB=0))


def ellipse_edge_offset(frm):
    """(50,40) 중심 타원의 경계까지 물러날 거리."""
    dx, dy = 50 - frm[0], 40 - frm[1]
    L = np.hypot(dx, dy)
    ux, uy = dx / L, dy / L
    return 1.0 / np.hypot(ux / EA, uy / EB)


nodes = {"A": (18, 70), "B": (34, 74), "C": (50, 68), "D": (66, 74), "E": (82, 70),
         "F": (24, 56), "G": (42, 57), "H": (60, 56), "I": (78, 57),
         "J": (26, 26), "K": (50, 19), "L": (74, 26)}
edges = [("A", "F"), ("B", "F"), ("B", "G"), ("C", "G"), ("C", "H"), ("D", "H"),
         ("D", "I"), ("E", "I"), ("F", "G"), ("G", "H"), ("H", "I"),
         ("F", "J"), ("I", "L"), ("J", "K"), ("L", "K")]
for a, b in edges:
    edge(nodes[a], nodes[b], R, R)
# 수용체 → 1차 신호분자
for i, (rx, ry) in enumerate(recept):
    edge((rx, ry - 4), list(nodes.values())[i], 0.5, R, color=ACCENT2, lw=1.1)
# 신호분자 → 유전자 발현 (수렴)
for n in ("F", "G", "H", "I", "K"):
    edge(nodes[n], (50, 40), R, ellipse_edge_offset(nodes[n]), lw=1.0)
for n, (nx, ny) in nodes.items():
    ax.add_patch(Circle((nx, ny), R, fc="white", ec=ACCENT, lw=1.2, zorder=6))
    ax.text(nx, ny, n, ha="center", va="center", fontsize=10, color=INK, zorder=7)
#  같은 문장이 캡션과 본문에 이미 있으므로 도판에서는 뺀다.
save(fig, "fig-signalling-network-concept")

# ============================================================ 3. 신약개발 과정 개관
#  2026-09-16 고침: 상자 안 3줄 라벨("비임상 연구/(Preclinical)/평균 18개월")이
#  상자 위아래로 넘치고, "허가"가 화살촉에 가려져 있었다. 소요기간은 상자 밖
#  윗줄 라벨로 빼서 세 구간(비임상·임상·NDA 심사)을 같은 꼴로 맞추고, 판정
#  라벨은 va="top" 으로 화살촉 아래에 붙인다. ylim 은 내용에 맞춰 빈 띠를 없앤다.
fig, ax = blank((8.6, 1.9), ylim=(20, 86))
BY, BH = 44, 24                       # 상자 아래변과 높이 (2줄 라벨이 여유 있게 든다)
phases = [
    ("발굴·탐색\n(Discovery)",     2,    17,  "#eef2f7"),
    ("비임상 연구\n(Preclinical)", 20,   17,  "#eef2f7"),
    ("제1상",                      40,   9.5, FILL),
    ("제2상",                      50.5, 9.5, FILL),
    ("제3상",                      61,   9.5, FILL),
    ("NDA 심사",                   72,   13,  FILL2),
    ("시판 후\n(제4상)",           87,   11,  "#eef2f7"),
]
for label, x, w, fc in phases:
    box(ax, x, BY, w, BH, label, fc=fc, ec=ACCENT, fs=10.6)
# 소요기간: 상자 위 괄선과 라벨 (세 구간 같은 형식)
for x0, x1, lab in [(20, 37, "평균 18개월"), (40, 70.5, "임상시험  ·  평균 5년"),
                    (72, 85, "평균 12개월")]:
    ax.plot([x0, x1], [72.5, 72.5], color=ACCENT, lw=1.0)
    for xx in (x0, x1):
        ax.plot([xx, xx], [70.5, 72.5], color=ACCENT, lw=1.0)
    ax.text((x0 + x1) / 2, 75.5, lab, ha="center", va="baseline", fontsize=10.6, color=ACCENT)
for x0, x1 in [(19, 20), (37, 40), (49.5, 50.5), (60, 61), (70.5, 72), (85, 87)]:
    arrow(ax, (x0, BY + BH / 2), (x1, BY + BH / 2), color=INK, lw=1.2, ms=9)
# 규제기관의 판정 지점: 상자 아래로 내려오는 화살표, 라벨은 화살촉 아래
for xx, lab in [(38.5, "IND"), (71.2, "NDA"), (86, "허가")]:
    ax.plot([xx, xx], [37, BY], color=ACCENT2, lw=1.6)
    ax.add_patch(Polygon([[xx - 1.7, 37], [xx + 1.7, 37], [xx, 33.5]],
                         fc=ACCENT2, ec=ACCENT2, zorder=5))
    ax.text(xx, 32, lab, ha="center", va="top", fontsize=10.8, color=ACCENT2, fontweight="bold")
#  같은 문장이 \cref{fig:ov-fdaprocess} 캡션에 있으므로 도판에서는 뺀다.
save(fig, "fig-development-process-overview")

# ============================================================ 4. 화합물 수의 축소 (깔때기)
fig, ax = blank((7.8, 4.6), ylim=(-10, 100))
# NTRM(2002) 의 화합물 수 축소: 수만>수백 → 수백>수십 → 수십>5개 → 5개>2개
steps = [("타겟 확인·검증", "수만"), ("선도물질 도출", "수백"), ("선도물질 최적화", "수십"),
         ("후보물질 도출", "5개"), ("비임상 개발", "2개")]
top_w, bot_w, y_top, y_bot = 76, 16, 92, 16
n = len(steps)
for i, (name, cnt) in enumerate(steps):
    y1 = y_top - i * (y_top - y_bot) / n
    y0 = y_top - (i + 1) * (y_top - y_bot) / n
    w1 = top_w - (top_w - bot_w) * i / n
    w0 = top_w - (top_w - bot_w) * (i + 1) / n
    shade = 0.10 + 0.13 * i
    ax.add_patch(Polygon([[50 - w1 / 2, y1], [50 + w1 / 2, y1],
                          [50 + w0 / 2, y0], [50 - w0 / 2, y0]],
                         fc=plt.matplotlib.colors.to_rgba(ACCENT, shade),
                         ec=ACCENT, lw=1.0, zorder=2))
    ax.text(50, (y0 + y1) / 2, cnt, ha="center", va="center",
            fontsize=12.6, color=INK, fontweight="bold", zorder=4)
    ax.text(50 - w1 / 2 - 3, (y0 + y1) / 2, name, ha="right", va="center",
            fontsize=10.6, color=INK, zorder=4)
ax.text(95, 76, "발굴\n(Discovery)", ha="center", va="center", fontsize=10.6, color=ACCENT)
ax.text(95, 32, "개발\n(Development)", ha="center", va="center", fontsize=10.6, color=ACCENT2)
ax.plot([88, 88], [61, 92], color=ACCENT, lw=2.2)
ax.plot([88, 88], [16, 59], color=ACCENT2, lw=2.2)
arrow(ax, (50, 15), (50, 6), color=INK, lw=1.4, ms=11)
ax.text(50, 2.5, "임상 개발  →  신약 탄생", ha="center", va="center",
        fontsize=11.2, color=INK)
ax.text(50, -7, "NTRM(2002)의 발굴 중심 시각. 각 단계는 화합물을 걸러 내는 체(sieve)이다.",
        ha="center", va="center", fontsize=10.4, color=MUTED)
save(fig, "fig-compound-attrition-funnel")

# ============================================================ 5. 회사 내부 관문(tollgate)
fig, ax = blank((9.0, 4.2))
#  평가 항목은 상자 폭을 넘지 않도록 세 줄로 끊는다(글자를 키우면서 줄바꿈을 다시 잡았다).
gates = [
    ("관문 1", "과제 제안", "미충족 수요·시장\n특허·타겟 경쟁력\n개발 전략", "연구소장"),
    ("관문 2", "정식과제 진행", "효능 가능성\n예비독성·선택성\nIP 확보 가능성", "연구소장"),
    ("관문 3", "전임상 진입", "CMC 용이성\n효능/독성 경쟁력\n차별화·TPP·EDP 준비", "R&D 위원회\n최고경영진"),
    ("관문 4", "제1상 진입", "효능/약리 경쟁력\n전임상 독성\nCMC·제제\nTPP·EDP 확보", "R&D 위원회\n최고경영진"),
    ("관문 5", "제2상 진입", "안전성·PK 충족 여부\n초기 PD 확인\n제2상 용량 확보", "R&D 위원회\n최고경영진"),
]
w = 17.5
for i, (g, dec, crit, who) in enumerate(gates):
    x = 2 + i * 19.4
    ax.text(x + w / 2, 92, g, ha="center", fontsize=11.0, color=ACCENT2, fontweight="bold")
    box(ax, x, 68, w, 18, dec, fc=FILL2, ec=ACCENT2, fs=10.8, weight="bold")
    box(ax, x, 34, w, 30, crit, fc="white", ec=ACCENT, fs=9.2)
    box(ax, x, 12, w, 16, who, fc="#f4f5f7", ec=ACCENT3, fs=9.6)
    if i < 4:
        arrow(ax, (x + w + 0.4, 77), (x + 19.4 - 0.4, 77), color=INK, lw=1.2, ms=9)
ax.text(0.6, 77, "결정", ha="center", va="center", rotation=90, fontsize=10.2, color=MUTED)
ax.text(0.6, 49, "평가 항목", ha="center", va="center", rotation=90, fontsize=10.2, color=MUTED)
ax.text(0.6, 20, "결정 주체", ha="center", va="center", rotation=90, fontsize=10.2, color=MUTED)
save(fig, "fig-internal-tollgates")

# ============================================================ 6. 네 개의 기둥
fig, ax = blank((7.4, 5.0), xlim=(0, 120), ylim=(-12, 102))
CX, CY, CR = 60, 52, 15
ax.add_patch(Circle((CX, CY), CR, fc="#fbfcfd", ec=ACCENT3, lw=1.3, ls=(0, (5, 4)), zorder=2))
ax.text(CX, CY, "제2상\n진입 결정", ha="center", va="center", zorder=3,
        fontsize=12.6, color=INK, fontweight="bold", linespacing=1.5)
pillars = [(60, 90, 40, 16, "약동학", "약이 작용 부위에 도달하는가"),
           (100, 52, 32, 20, "안전성", "감당할 수 있는\n독성인가"),
           (60, 14, 40, 16, "물질생산", "순도와 경제성을 확보했는가"),
           (20, 52, 32, 20, "유효성", "의미 있는\n효과가 있는가")]
for px, py, w, h, title, sub in pillars:
    box(ax, px - w / 2, py - h / 2, w, h, f"{title}\n{sub}", fc=FILL, ec=ACCENT, fs=10.0)
    dx, dy = (CX - px), (CY - py)
    L = np.hypot(dx, dy)
    ux, uy = dx / L, dy / L
    # 상자 경계까지의 거리는 화살표 방향(가로/세로)에 따라 다르다
    start = (w / 2 if abs(ux) > abs(uy) else h / 2) + 1.5
    arrow(ax, (px + ux * start, py + uy * start),
          (px + ux * (L - CR - 1.5), py + uy * (L - CR - 1.5)),
          color=ACCENT3, lw=1.4, ms=11, style="<|-|>")
#  첫 문장은 캡션과 겹치므로 뺀다. 남긴 문장은 캡션에 없는 내용이다.
ax.text(CX, -8, "발굴부터 제4상까지 언제나 함께 살펴야 한다.",
        ha="center", va="center", fontsize=10.6, color=MUTED)
save(fig, "fig-four-pillars")

# ============================================================ 7. 유익성-위해성 곡선
fig, ax = plt.subplots(figsize=(6.5, 4.2))
c = np.linspace(0, 10, 400)
benefit = 1.0 / (1 + np.exp(-(c - 4.0) * 1.25))
risk = 0.14 + 1.15 / (1 + np.exp(-(c - 7.6) * 1.05))
ax.plot(c, benefit, color=ACCENT, lw=2.4, label="유익성 (benefit)")
ax.plot(c, risk, color=ACCENT2, lw=2.4, ls="--", label="위해성 (risk)")
gap = benefit - risk
i_best = int(np.argmax(gap))
lo = c[np.argmax(gap > 0)]
hi = c[len(gap) - 1 - np.argmax(gap[::-1] > 0)]
ax.axvspan(lo, hi, color="#eef4ea", zorder=0)
ax.annotate("", xy=(c[i_best], benefit[i_best]), xytext=(c[i_best], risk[i_best]),
            arrowprops=dict(arrowstyle="<->", color=INK, lw=1.5))
ax.text(c[i_best] + 0.22, (benefit[i_best] + risk[i_best]) / 2,
        "순이익이\n최대인 지점", fontsize=10.2, color=INK, va="center",
        bbox=dict(facecolor="white", edgecolor="none", pad=1.5))
# 축 아래는 x축 이름이 차지하므로 음영대의 위쪽 빈 자리에 적는다(라벨 겹침 방지).
ax.text((lo + hi) / 2, 1.28, "치료역 (therapeutic window)", ha="center", va="center",
        fontsize=10.4, color="#4a6b3a")
ax.set_xlabel("용량 또는 농도")
ax.set_ylabel("유익성 또는 위해성의 크기")
ax.set_xticks([]); ax.set_yticks([])
ax.set_ylim(-0.05, 1.35)
ax.legend(frameon=False, loc="upper left", fontsize=10.5)
despine(ax)
save(fig, "fig-benefit-risk-curve")

# ============================================================ 8. 역가와 효능
fig, ax = plt.subplots(figsize=(6.5, 4.2))
conc = np.logspace(-10, -4, 400)
A = 1.00 * conc / (1e-6 + conc)      # EC50 = 1e-6, Emax = 1.00
B = 0.50 * conc / (1e-8 + conc)      # EC50 = 1e-8, Emax = 0.50
ax.semilogx(conc, A, color=ACCENT, lw=2.4, label="약물 A  (EC$_{50}$ = 10$^{-6}$ M, E$_{max}$ = 1.0)")
ax.semilogx(conc, B, color=ACCENT2, lw=2.4, ls="--", label="약물 B  (EC$_{50}$ = 10$^{-8}$ M, E$_{max}$ = 0.5)")
for ec, val, col in [(1e-6, 0.5, ACCENT), (1e-8, 0.25, ACCENT2)]:
    ax.plot([conc[0], ec], [val, val], color=col, lw=0.9, ls=":")
    ax.plot([ec, ec], [0, val], color=col, lw=0.9, ls=":")
ax.annotate("B가 더 낮은 농도에서 작용한다\n→ 역가(potency)는 B가 높다",
            xy=(1e-8, 0.25), xytext=(1.4e-10, 0.70), fontsize=9.9, color=ACCENT2,
            arrowprops=dict(arrowstyle="->", color=ACCENT2, lw=0.9))
ax.annotate("A는 더 큰 최대반응에 도달한다\n→ 효능(efficacy)은 A가 우수하다",
            xy=(2e-5, 0.97), xytext=(1.1e-8, 1.06), fontsize=9.9, color=ACCENT,
            arrowprops=dict(arrowstyle="->", color=ACCENT, lw=0.9))
ax.set_xlabel("농도 (M)"); ax.set_ylabel("반응 (임의 단위)")
ax.set_ylim(-0.03, 1.26)
ax.legend(frameon=False, loc="lower right", fontsize=9.8)
ax.grid(True, color=GRID, lw=0.6); ax.set_axisbelow(True)
despine(ax)
save(fig, "fig-potency-vs-efficacy")

# ============================================================ 9. LogP 교과서 모식도
fig, ax = plt.subplots(figsize=(6.5, 4.0))
lp = np.linspace(-4, 8, 400)
f = np.exp(-((lp - 1.5) ** 2) / (2 * 1.05 ** 2))
ax.plot(lp, f, color=ACCENT, lw=2.4)
ax.fill_between(lp, 0, f, where=(lp >= 0) & (lp <= 3), color=FILL, zorder=0)
ax.axvline(0, color=MUTED, lw=0.9, ls=":"); ax.axvline(3, color=MUTED, lw=0.9, ls=":")
#  한글 글꼴(KoPubWorldDotum)은 U+003C 에 각괄호형 글리프를 주므로 '<' 가 〈 로 인쇄된다.
#  부등호는 반드시 mathtext(dejavusans)로 조판한다.
ax.text(1.5, 1.06, "최적 구간\n" r"$0 < \mathrm{LogP} < 3$", ha="center",
        fontsize=10.6, color=ACCENT, linespacing=1.5)
ax.text(-2.6, 0.34, "지질막 투과도가\n낮다", ha="center", fontsize=10.2, color=MUTED)
ax.text(6.0, 0.34, "수용성이\n낮다", ha="center", fontsize=10.2, color=MUTED)
ax.set_xlabel("LogP"); ax.set_ylabel("경구 생체이용률 (모식)")
ax.set_yticks([]); ax.set_ylim(0, 1.28)
despine(ax)
save(fig, "fig-logp-textbook-schematic")

# ============================================================ 10. 확실성과 정보량
fig, ax = plt.subplots(figsize=(6.5, 4.1))
t = np.linspace(0, 10, 400)
certainty = 1.0 / (1 + np.exp(-(t - 3.6) * 0.86))
information = 0.035 * np.exp(t * 0.365)
ax.plot(t, certainty, color=ACCENT, lw=2.4, label="확실성 (certainty)")
ax.plot(t, information, color=ACCENT2, lw=2.4, ls="--", label="정보량 (information)")
ix = int(np.argmin(np.abs(certainty - information))[()] if False else
         np.argmin(np.abs(certainty - information)))
ax.plot(t[ix], certainty[ix], "o", ms=7, color=INK, zorder=5)
ax.annotate("이 지점을 지나면\n자료는 폭증하지만\n확실성은 거의 늘지 않는다",
            xy=(t[ix], certainty[ix]), xytext=(5.3, 0.46), fontsize=10.0, color=INK,
            ha="center", va="center",
            bbox=dict(facecolor="white", edgecolor="none", pad=1.5),
            arrowprops=dict(arrowstyle="->", color=INK, lw=0.9))
for xx, lab in [(1.4, "제1상"), (4.3, "제2상"), (7.4, "제3상")]:
    ax.axvline(xx, color=GRID, lw=1.0, zorder=0)
    ax.text(xx, 1.30, lab, ha="center", fontsize=10.2, color=MUTED)
ax.set_xlabel("개발 시간 또는 단계"); ax.set_ylabel("수준")
ax.set_xticks([]); ax.set_yticks([]); ax.set_ylim(0, 1.38)
ax.legend(frameon=False, loc="lower right", fontsize=10.5)
despine(ax)
save(fig, "fig-certainty-vs-information")

# ============================================================ 11. 위험 인식의 편향
fig, ax = plt.subplots(figsize=(6.5, 4.9))
lo, hi = 1, 1e6
xs = np.logspace(0, 6, 200)
ax.loglog(xs, xs, color=MUTED, lw=1.2, ls="--", label="정확한 판단 (기울기 1)")
def judged(x):
    return 300 * (x / 300) ** 0.42


ax.loglog(xs, judged(xs), color=ACCENT, lw=2.2, label=r"실제 판단 경향 (기울기 $<$ 1)")
# 표시점은 반드시 판단 곡선 위에 놓는다
pts = [(3, "매우 드물지만\n극적인 사건", 6.0), (3e3, "중간 빈도의 사건", 3.0),
       (6e5, "흔하지만\n평범한 사건", 0.16)]
for px, lab, fac in pts:
    py = judged(px)
    ax.plot(px, py, "o", ms=8, color=ACCENT2, zorder=5)
    ax.annotate(lab, xy=(px, py), xytext=(px, py * fac), fontsize=9.9,
                color=ACCENT2, ha="center",
                va="bottom" if fac > 1 else "top")
ax.text(12, 1.1e4, "실제보다\n과대평가", fontsize=10.6, color=INK, ha="center")
ax.text(2.2e5, 90, "실제보다\n과소평가", fontsize=10.6, color=INK, ha="center")
ax.set_xlabel("실제 통계에 근거한 연간 사망자 수")
ax.set_ylabel("사람들이 추정한 연간 사망자 수")
ax.set_xlim(1, 1e6); ax.set_ylim(10, 1e6)
ax.legend(frameon=False, loc="lower right", fontsize=10.1)
ax.grid(True, which="major", color=GRID, lw=0.6); ax.set_axisbelow(True)
despine(ax)
save(fig, "fig-risk-perception-bias")

# ============================================================ 12. 자발적 위험 vs 비자발적 위험
fig, ax = plt.subplots(figsize=(6.5, 4.7))
b = np.logspace(-0.4, 2.4, 100)
ax.loglog(b, 1.1e3 * b ** 1.0, color=ACCENT2, lw=2.2, label="자발적 위험 (voluntary)")
ax.loglog(b, 1.1e3 * b ** 1.0 / 1000, color=ACCENT, lw=2.2, ls="--",
          label="비자발적 위험 (involuntary)")
ax.annotate("", xy=(60, 6.6e4), xytext=(60, 66),
            arrowprops=dict(arrowstyle="<->", color=INK, lw=1.4))
ax.text(69, 2.2e3, "같은 편익이라도\n수용되는 위험은\n약 1000배 차이", fontsize=10.0,
        color=INK, va="center")
for bx, ry, lab, col in [(30, 3.3e4, "흡연·음주 등\n스스로 택한 위험", ACCENT2),
                         (25, 27, "예방접종 등\n건강인에게 부과되는 위험", ACCENT)]:
    ax.plot(bx, ry, "o", ms=8, color=col, zorder=5)
    ax.annotate(lab, xy=(bx, ry), xytext=(bx * 0.10, ry * 1.9),
                fontsize=9.9, color=col)
ax.set_xlabel("사회가 얻는 편익 (연간 지출 규모)")
ax.set_ylabel("사회가 수용하는 위험 (연간 사망자 수)")
ax.legend(frameon=False, loc="lower right", fontsize=10.1)
ax.grid(True, which="major", color=GRID, lw=0.6); ax.set_axisbelow(True)
despine(ax)
save(fig, "fig-voluntary-vs-involuntary-risk")

# ============================================================ 13. 등가위험
fig, ax = blank((8.4, 3.4))
items = ["자동차로\n약 6,400 km 주행", "담배\n100개비 흡연",
         "암벽등반\n2시간", "화학산업에서\n1년 근무"]
for i, it in enumerate(items):
    x = 3 + i * 24.5
    box(ax, x, 34, 21, 34, it, fc=FILL, ec=ACCENT, fs=10.8)
    if i < 3:
        ax.text(x + 22.7, 51, "=", ha="center", va="center",
                fontsize=17, color=ACCENT2, fontweight="bold")
ax.text(50, 84, "다음 네 가지 행위의 사망 위험은 서로 같은 수준이다",
        ha="center", fontsize=12.2, color=INK)
ax.text(50, 17,
        "서로 다른 종류의 위험은 공통 척도로 환산해야 비교할 수 있다.\n"
        "환산하지 않은 채로는 '더 위험하다'는 말이 성립하지 않는다.",
        ha="center", fontsize=10.4, color=MUTED, linespacing=1.5)
save(fig, "fig-equivalent-risk")

# ============================================================ 14. 더할 수 없는 숫자
fig, ax = blank((6.0, 4.4), ylim=(-16, 100))
ax.add_patch(FancyBboxPatch((14, 26), 72, 62, boxstyle="round,pad=0,rounding_size=3",
                            fc="#f7f8f5", ec=INK, lw=2.0, zorder=2))
ax.add_patch(Rectangle((26, 4), 3.6, 24, fc=MUTED, ec=INK, lw=1.0, zorder=1))
ax.add_patch(Rectangle((70, 4), 3.6, 24, fc=MUTED, ec=INK, lw=1.0, zorder=1))
ax.text(50, 79, "○ ○ 면", ha="center", fontsize=15, color=INK, fontweight="bold", zorder=3)
rows = [("설립", "1802", "년"), ("해발", "620", "m"), ("인구", "3,700", "명")]
yy = 66
for lab, val, unit in rows:
    ax.text(26, yy, lab, ha="left", fontsize=11.5, color=INK, zorder=3)
    ax.text(70, yy, val, ha="right", fontsize=11.5, color=INK, zorder=3)
    ax.text(72, yy, unit, ha="left", fontsize=9.8, color=MUTED, zorder=3)
    yy -= 9.5
ax.plot([25, 74], [41.5, 41.5], color=INK, lw=1.2, zorder=3)
ax.text(26, 34, "합계", ha="left", fontsize=11.5, color=ACCENT2,
        fontweight="bold", zorder=3)
ax.text(70, 34, "6,122", ha="right", fontsize=11.5, color=ACCENT2,
        fontweight="bold", zorder=3)
ax.text(50, -10, "단위와 의미가 다른 숫자는 더할 수 없다.\n"
                 "숫자를 다룬다고 해서 모두 정량적 사고인 것은 아니다.",
        ha="center", va="center", fontsize=10.4, color=MUTED, linespacing=1.5)
save(fig, "fig-numbers-that-cannot-be-added")

# ============================================================ 15. 학문 영역 Venn
fig, ax = blank((7.0, 4.8))
#  ox: 라벨의 좌우 치우침. 기본 ±11 이지만 '약리학·약동학'은 길어서 그대로 두면
#  타원 왼쪽 선을 글자가 넘어간다. 이 라벨만 안쪽으로 당긴다.
ovals = [(36, 62, "약리학·약동학\n약력학", ACCENT, -6),
         (64, 62, "통계학", ACCENT2, 11),
         (36, 40, "수학", "#2e7d32", -11),
         (64, 40, "프로그래밍", "#6a1b9a", 11)]
for cx, cy, lab, col, ox in ovals:
    ax.add_patch(Ellipse((cx, cy), 46, 34, fc=col, ec=col, alpha=0.10, lw=1.6, zorder=2))
    ax.add_patch(Ellipse((cx, cy), 46, 34, fc="none", ec=col, lw=1.6, zorder=3))
for cx, cy, lab, col, ox in ovals:
    oy = 7.5 if cy > 50 else -7.5
    ax.text(cx + ox, cy + oy, lab, ha="center", va="center",
            fontsize=11.2, color=col, zorder=6, linespacing=1.4)
ax.add_patch(FancyBboxPatch((28, 44), 44, 15,
                            boxstyle="round,pad=0,rounding_size=2",
                            fc="white", ec=INK, lw=1.2, alpha=0.96, zorder=6))
ax.text(50, 51.5, "PK-PD·임상시험 모델링과 시뮬레이션\n(pharmacometrics)",
        ha="center", va="center", fontsize=10.4, color=INK, zorder=7, linespacing=1.5)
ax.text(9, 15, "규제\n(Regulation)", ha="center", fontsize=10.6, color=MUTED)
ax.text(91, 15, "경영·경제\n(Business/Economics)", ha="center", fontsize=10.6, color=MUTED)
ax.add_patch(FancyBboxPatch((3, 6), 94, 90, boxstyle="round,pad=0,rounding_size=3",
                            fc="none", ec=GRID, lw=1.2, ls=(0, (5, 4)), zorder=1))
save(fig, "fig-disciplines-venn")

print("[schematic figures] done")
