"""공통 스타일 설정. 모든 그림은 이 파일의 setup()을 먼저 호출한다.

이 폴더(pyfig/)는 제1장·제2장의 개념도·자료그림 22점을 PDF 로 생성한다.
출력은 ../figures/<새이름>.pdf 이며, 새 이름은 아래 NAME_MAP 이 정한다.
(R 로 생성하는 그림은 R/snippets/ + R/build.R 의 freeze() 파이프라인을 쓴다.)
"""
import os
import re
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
from matplotlib import rcParams
from matplotlib.text import Text

HERE = os.path.dirname(os.path.abspath(__file__))
DATA = os.path.abspath(os.path.join(HERE, os.pardir, "data"))

# 언어 스위치 (2026-09-22). 기본은 한국어판(ko)이며 산출물은 종전과 같다.
#   CTDA_LANG=en python pyfig/mkfig_data.py   -> ../En/figures/ 에 영어 라벨, Arial 로 그린다.
# 스크립트의 라벨은 한국어 그대로 두고, 저장 직전에 translate_fig() 가 그림 안의
# 모든 Text 를 labels_en.py 의 사전으로 옮긴다(f-문자열로 값이 섞인 라벨까지 잡힌다).
# 바꾸고도 한글이 남으면 save() 가 예외를 던지므로 조용한 누락이 없다.
LANG = os.environ.get("CTDA_LANG", "en")
if LANG not in ("ko", "en"):
    raise ValueError("CTDA_LANG must be 'ko' or 'en', not %r" % LANG)
OUT = os.path.abspath(os.path.join(HERE, os.pardir, "figures"))
if LANG == "en":
    from labels_en import EN as _EN
else:
    _EN = {}

HANGUL = re.compile("[가-힣]")
#  조각 치환은 긴 것부터 해야 짧은 열쇠가 긴 라벨을 먼저 깨뜨리지 않는다.
_KEYS = sorted(_EN, key=len, reverse=True)


def T(s):
    """라벨 문자열. 영어 모드에서는 labels_en.EN 으로 옮기고, 한국어 모드에서는 그대로."""
    return _EN.get(s, s) if LANG == "en" else s


def tr(s):
    """통째로 맞는 것을 먼저 찾고, 없으면 긴 조각부터 바꾼다."""
    if s in _EN:
        return _EN[s]
    for ko in _KEYS:
        if ko in s:
            s = s.replace(ko, _EN[ko])
    return s


if LANG == "en":
    #  라벨은 '만들어질 때' 옮긴다. 저장 직전에 옮기면 tight_layout 이나 상자 맞춤
    #  검사가 한글 문자열의 너비로 배치를 계산해 버리고(Arial 에는 한글 글리프가
    #  없어 경고까지 난다), 영어 라벨의 실제 너비와 어긋난다.
    _orig_set_text = Text.set_text

    def _set_text(self, s):
        if isinstance(s, str) and HANGUL.search(s):
            s = tr(s)
        return _orig_set_text(self, s)

    Text.set_text = _set_text


def translate_fig(fig):
    """영어 모드에서 남은 한글 Text 를 옮기고(그물), 남은 한글 문자열을 돌려준다."""
    if LANG != "en":
        return []
    left = []
    for t in fig.findobj(Text):
        s = t.get_text()
        if not s or not HANGUL.search(s):
            continue
        new = tr(s)
        if new != s:
            t.set_text(new)
        if HANGUL.search(new) and new not in left:
            left.append(new)
    return left

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
    if LANG == "en":
        # 영어판: R 그림(En/build.R 의 ctda.figfont)과 같은 Arial.
        rcParams["font.family"] = "Arial"
        rcParams["font.weight"] = "normal"
    else:
        # 본문(LaTeX)은 KoPubWorldBatang Medium(serif), 그림 라벨은 KoPubWorldDotum Medium(sans)
        family, weight = korean_font()
        rcParams["font.family"] = family
        rcParams["font.weight"] = weight   # 기본 굵기를 Medium 파일에 맞춘다(Light 로 빠지지 않게)
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
    left = translate_fig(fig)          # 영어 모드에서만 동작한다(두 번 불러도 무해)
    if left:
        raise RuntimeError("%s: labels_en.EN 에 없는 한글 라벨 %d개\n  " % (name, len(left))
                           + "\n  ".join(repr(s) for s in left))
    pdf = os.path.join(OUT, newname + ".pdf")
    fig.savefig(pdf)
    plt.close(fig)
    print("  saved: %-40s -> %s.pdf" % (name, newname))
