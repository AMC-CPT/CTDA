"""공통 스타일 설정. 모든 그림은 이 파일의 setup()을 먼저 호출한다.

이 폴더(pyfig/)는 제1장·제2장의 개념도·자료그림 22점을 PDF 로 생성한다.
출력은 ../figures/<새이름>.pdf 이며, 새 이름은 아래 NAME_MAP 이 정한다.
(R 로 생성하는 그림은 R/snippets/ + R/build.R 의 freeze() 파이프라인을 쓴다.)
"""
import os
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
from matplotlib import rcParams

HERE = os.path.dirname(os.path.abspath(__file__))
OUT = os.path.abspath(os.path.join(HERE, os.pardir, "figures"))
DATA = os.path.abspath(os.path.join(HERE, os.pardir, "data"))

# 강의 원고의 그림 이름 -> 책의 그림 파일 이름
# 제1장은 ov-*, 제2장은 qdm-* 로 통일한다.
NAME_MAP = {
    # --- 제1장 ---
    "fig-development-process-overview":      "ov-fda-process",
    "fig-compound-attrition-funnel":         "ov-attrition-funnel",
    "fig-internal-tollgates":                "ov-tollgates",
    "fig-four-pillars":                      "ov-four-pillars",
    "fig-potency-vs-efficacy":               "ov-potency-efficacy",
    "fig-benefit-risk-curve":                "ov-benefit-risk",
    "fig-logp-textbook-schematic":           "ov-logp-schematic",
    "fig-logp-vs-bioavailability-reality":   "ov-logp-reality",
    "fig-ind-to-market":                     "ov-ind-to-market",
    "fig-risk-perception-bias":              "ov-risk-perception",
    "fig-equivalent-risk":                   "ov-equivalent-risk",
    "fig-voluntary-vs-involuntary-risk":     "ov-voluntary-risk",
    "fig-numbers-that-cannot-be-added":      "ov-numbers-not-added",
    # --- 제2장 ---
    "fig-observation-vs-inference":          "qdm-observation-inference",
    "fig-signalling-network-concept":        "qdm-signalling-network",
    "fig-anscombe-quartet":                  "qdm-anscombe",
    "fig-simpsons-paradox":                  "qdm-simpson",
    "fig-korea-mortality-2008-2025":         "qdm-korea-mortality",
    "fig-dose-response-vs-exposure-response":"qdm-dose-vs-exposure",
    "fig-likelihood-interval":               "qdm-likelihood-interval",
    "fig-certainty-vs-information":          "qdm-certainty-information",
    "fig-disciplines-venn":                  "qdm-disciplines-venn",
}

# 교재용 색상 (흑백 인쇄에서도 구분되도록 명도 차이를 둔다)
INK      = "#1a1a1a"
MUTED    = "#6b7280"
GRID     = "#d8dde3"
ACCENT   = "#1f4e79"   # 진한 남색
ACCENT2  = "#b45309"   # 주황갈색
ACCENT3  = "#6b7280"   # 회색
FILL     = "#dbe4ee"
FILL2    = "#f3e3cc"


def korean_font():
    """KoPubWorld 돋움 Medium 을 파일로 찾아 (family 이름, 굵기) 를 돌려준다.

    matplotlib 판에 따라 이 글꼴의 family 이름이 "KoPubWorldDotum Medium"(옛 판) 또는
    "KoPubWorldDotum"(3.10) 으로 읽힌다. 이름을 소스에 고정해 두면 다른 판에서 조용히
    DejaVu Sans 로 대체되어 한글이 네모로 찍히고 글자 폭이 달라져 상자 배치까지 어긋난다
    (2026-09-16 실제 발생). 그래서 글꼴 파일을 직접 등록하고 이름과 굵기를 파일에서 읽는다.
    """
    from matplotlib import font_manager as fm
    dirs = [r"C:\Windows\Fonts",
            os.path.join(os.environ.get("LOCALAPPDATA", ""), r"Microsoft\Windows\Fonts")]
    for d in dirs:
        medium = os.path.join(d, "KoPubWorld Dotum Medium.ttf")
        if not os.path.exists(medium):
            continue
        # 같은 family 의 Light 는 목록에서 뺀다. weight="normal"(400) 로 그린 글자가
        # Light(300) 와 Medium(500) 사이에서 Light 로 떨어져, 본문 글꼴(Medium)보다
        # 가늘게 찍히기 때문이다. 옛 판에서는 family 이름에 Medium 이 붙어 있어 이런
        # 일이 없었다.
        fm.fontManager.ttflist[:] = [f for f in fm.fontManager.ttflist
                                     if os.path.basename(f.fname).lower() != "kopubworld dotum light.ttf"]
        for fn in ("KoPubWorld Dotum Medium.ttf", "KoPubWorld Dotum Bold.ttf"):
            fm.fontManager.addfont(os.path.join(d, fn))      # 캐시에 없어도 등록된다(findfont 캐시도 비운다)
        ent = [f for f in fm.fontManager.ttflist
               if os.path.normcase(f.fname) == os.path.normcase(medium)][-1]
        return ent.name, ent.weight
    raise RuntimeError("KoPubWorld Dotum Medium.ttf 를 찾지 못했다 (Windows 글꼴 폴더를 확인)")


def setup():
    os.makedirs(OUT, exist_ok=True)
    # 본문(LaTeX)은 KoPubWorldBatang Medium(serif), 그림 라벨은 KoPubWorldDotum Medium(sans)
    family, weight = korean_font()
    rcParams["font.family"] = family
    rcParams["font.weight"] = weight       # 기본 굵기를 Medium 파일에 맞춘다(Light 로 빠지지 않게)
    rcParams["axes.unicode_minus"] = False
    # 한글 글꼴에는 mathtext 용 글리프가 없으므로 수식은 DejaVu 로 조판한다.
    rcParams["mathtext.fontset"] = "dejavusans"
    rcParams["font.size"] = 11
    rcParams["axes.titlesize"] = 12
    rcParams["axes.labelsize"] = 11
    rcParams["axes.edgecolor"] = INK
    rcParams["axes.linewidth"] = 0.9
    rcParams["axes.grid"] = False
    rcParams["xtick.color"] = INK
    rcParams["ytick.color"] = INK
    rcParams["text.color"] = INK
    rcParams["figure.facecolor"] = "white"
    rcParams["savefig.facecolor"] = "white"
    rcParams["savefig.bbox"] = "tight"
    rcParams["savefig.pad_inches"] = 0.15
    rcParams["svg.fonttype"] = "none"
    # PDF 에 글꼴을 Type 42(TrueType) 로 서브셋 내장한다.
    rcParams["pdf.fonttype"] = 42


def despine(ax, keep=("left", "bottom")):
    for s in ("top", "right", "left", "bottom"):
        ax.spines[s].set_visible(s in keep)


def save(fig, name):
    """PDF 만 저장한다. 이름은 NAME_MAP 을 거쳐 책의 파일 이름으로 바뀐다."""
    if name not in NAME_MAP:
        raise KeyError(
            "NAME_MAP 에 없는 그림 이름: %r. 맵에 등록하거나 이름을 고쳐라 "
            "(조용한 누락을 막기 위해 예외를 던진다)." % (name,))
    newname = NAME_MAP[name]
    pdf = os.path.join(OUT, newname + ".pdf")
    fig.savefig(pdf)
    plt.close(fig)
    print("  saved: %-40s -> %s.pdf" % (name, newname))
