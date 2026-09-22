# -*- coding: utf-8 -*-
"""영어판 그림 라벨 사전 (2026-09-22).

`CTDA_LANG=en` 으로 pyfig 를 돌리면 mkfig_common.translate_fig() 가 그림 안의
모든 Text 를 이 사전으로 옮긴다. 열쇠는 한국어판 스크립트가 실제로 그리는
문자열이며, 통째로 맞는 것을 먼저 찾고 없으면 긴 조각부터 바꾼다(f-문자열처럼
값이 섞인 라벨을 위한 것이다). 바꾸고도 한글이 남으면 save() 가 예외를 던지므로
사전에서 빠진 라벨이 조용히 인쇄되는 일은 없다.

수식(mathtext) 부분은 그대로 두어야 하므로, 수식이 섞인 라벨은 통째로 적는다.
용어는 En/book 의 본문 번역과 맞춘다(역가 potency, 효능 efficacy, 치료역
therapeutic window, 조사망률 crude mortality rate 등).
"""

EN = {
    # ---------------------------------------------------------------- 제2장 한국 사망률
    "연도": "Year",
    "사망자 수 (천 명)": "Deaths (thousands)",
    "(가) 사망자 수": "(a) Deaths",
    "확정치": "Final",
    "잠정치": "Preliminary",
    "조사망률 (10만 명당)": "Crude rate (per 100,000)",
    "(나) 조사망률": "(b) Crude mortality rate",
    "2022년 327.3\n(전년 대비 +29.0)": "327.3 in 2022\n(+29.0 over 2021)",
    "연령표준화 사망률 (10만 명당)": "Age-standardized rate (per 100,000)",
    "(다) 연령표준화 사망률": "(c) Age-standardized mortality rate",

    # ---------------------------------------------------------------- 앤스컴의 사중주
    "자료 1": "Data set 1",
    "자료 2": "Data set 2",
    "자료 3": "Data set 3",
    "자료 4": "Data set 4",
    "네 자료의 평균·분산·상관계수·회귀직선·결정계수는 사실상 같다":
        "Mean, variance, correlation, regression line and $R^2$ are essentially the same in all four",

    # ---------------------------------------------------------------- 심슨의 역설 (f-문자열)
    "(가) 전체를 한 덩어리로 보면: r = ": "(a) Pooled into one mass: r = ",
    "(나) 층으로 나누면: 각 층에서 r = ": "(b) Split into strata: within each stratum r = ",

    # ---------------------------------------------------------------- LogP 대 생체이용률
    "교과서가 말하는 최적 구간 ($0 < \\mathrm{LogP} < 3$)":
        "Optimal range of the textbooks ($0 < \\mathrm{LogP} < 3$)",
    "경구 생체이용률 (F)": "Oral bioavailability (F)",
    "최적 구간\n$0 < \\mathrm{LogP} < 3$": "Optimal range\n$0 < \\mathrm{LogP} < 3$",
    "지질막 투과도가\n낮다": "Lipid membrane\npermeation is poor",
    "수용성이\n낮다": "Aqueous solubility\nis poor",
    "경구 생체이용률 (모식)": "Oral bioavailability (schematic)",

    # ---------------------------------------------------------------- IND 에서 시판까지
    "36개\n(IND 진입 화합물의 5~8%)": "36 compounds\n(5-8% of those entering IND)",
    "제2상에 넘기는\n화합물 100개 감소": "100 fewer compounds\npassed to phase 2",
    "시판": "Market",
    "화합물 수": "Number of compounds",
    "최악 (Worst)": "Worst",
    "현재 (Current)": "Current",
    "개선 (Improved)": "Improved",
    "이상 (Ideal)": "Ideal",

    # ---------------------------------------------------------------- 관측과 추론
    "실제로 관측된 것\n\n· 양 한 마리\n· 한쪽 옆모습만\n· 한 장소, 한 시점":
        "What was actually observed\n\n· one sheep\n· one side only\n· one place, one moment",
    "남자 1  |  호주 양은 검다": "Man 1  |  Australian sheep are black",
    "모집단 전체로 과잉일반화\n(주장의 범위: 호주의 모든 양)":
        "Overgeneralized to the whole population\n(scope: every sheep in Australia)",
    "남자 2  |  몇몇 호주 양은 검다": "Man 2  |  Some Australian sheep are black",
    "존재양화로 후퇴\n(주장의 범위: 호주 양의 일부)":
        "Retreat to existential quantification\n(scope: some Australian sheep)",
    "남자 3  |  적어도 한 마리는 검다": "Man 3  |  At least one sheep is black",
    "표본 한 개로 축소\n(주장의 범위: 관측된 그 한 마리)":
        "Reduced to the single sample\n(scope: the one sheep observed)",
    "남자 4  |  적어도 한 마리는 한쪽 면이 검다":
        "Man 4  |  At least one is black on one side",
    "관측된 것만 주장\n(주장의 범위: 관측된 그 한쪽 면)":
        "Claims only what was observed\n(scope: the one side observed)",
    "관측이 뒷받침하는 경계": "Limit of what the observation supports",
    "관측이 뒷받침하지 못하는 부분": "Beyond what the observation supports",

    # ---------------------------------------------------------------- 신호전달망
    "유전자 발현": "Gene\nexpression",
    "수용체 1": "Receptor 1",
    "수용체 2": "Receptor 2",
    "수용체 3": "Receptor 3",
    "수용체 4": "Receptor 4",
    "수용체 5": "Receptor 5",

    # ---------------------------------------------------------------- 신약개발 과정 개관
    "발굴·탐색\n(Discovery)": "Discovery and\nscreening",
    "비임상 연구\n(Preclinical)": "Nonclinical\nstudies",
    "NDA 심사": "NDA review",
    "시판 후\n(제4상)": "Post-marketing\n(phase 4)",
    #  기간 라벨은 상자 위 괄선 폭(각각 17·30·13 단위) 안에 들어가야 서로 겹치지
    #  않는다. '평균'이라는 말은 캡션이 이미 하고 있으므로 뺀다.
    "평균 18개월": "18 months",
    "임상시험  ·  평균 5년": "Clinical trials, 5 years",
    "평균 12개월": "12 months",
    "허가": "Approval",

    # ---------------------------------------------------------------- 화합물 수의 축소
    "수만": "tens of thousands",
    "수백": "hundreds",
    "수십": "tens",
    "5개": "5",
    "2개": "2",
    "타겟 확인·검증": "Target identification and validation",
    "선도물질 도출": "Lead generation",
    "선도물질 최적화": "Lead optimization",
    "후보물질 도출": "Candidate selection",
    "비임상 개발": "Nonclinical development",
    "발굴\n(Discovery)": "Discovery",
    "개발\n(Development)": "Development",
    "임상 개발  →  신약 탄생": "Clinical development  →  a new drug",
    "NTRM(2002)의 발굴 중심 시각. 각 단계는 화합물을 걸러 내는 체(sieve)이다.":
        "The discovery-centered view of NTRM (2002). Each stage is a sieve that filters compounds.",

    # ---------------------------------------------------------------- 회사 내부 관문
    "관문 1": "Gate 1",
    "관문 2": "Gate 2",
    "관문 3": "Gate 3",
    "관문 4": "Gate 4",
    "관문 5": "Gate 5",
    "과제 제안": "Project proposal",
    "정식과제 진행": "Formal project",
    "전임상 진입": "Enter preclinical",
    "제1상 진입": "Enter phase 1",
    "제2상 진입": "Enter phase 2",
    "연구소장": "Head of research",
    "R&D 위원회\n최고경영진": "R&D committee\nTop management",
    "미충족 수요·시장\n특허·타겟 경쟁력\n개발 전략":
        "Unmet need, market\nPatents, target\nDevelopment strategy",
    "효능 가능성\n예비독성·선택성\nIP 확보 가능성":
        "Potential efficacy\nPreliminary toxicity\nIP prospects",
    "CMC 용이성\n효능/독성 경쟁력\n차별화·TPP·EDP 준비":
        "Ease of CMC\nEfficacy, toxicity edge\nTPP and EDP prepared",
    "효능/약리 경쟁력\n전임상 독성\nCMC·제제\nTPP·EDP 확보":
        "Efficacy, pharmacology\nPreclinical toxicity\nCMC, formulation\nTPP and EDP secured",
    "안전성·PK 충족 여부\n초기 PD 확인\n제2상 용량 확보":
        "Safety and PK met\nEarly PD confirmed\nPhase 2 dose secured",
    #  왼쪽 세로 라벨 셋은 각 행의 높이(약 24 단위) 안에 들어가야 서로 겹치지 않는다.
    "결정": "Decision",
    "평가 항목": "Assessed",
    "결정 주체": "Decided by",

    # ---------------------------------------------------------------- 네 개의 기둥
    "제2상\n진입 결정": "Decision to\nenter phase 2",
    "약동학\n약이 작용 부위에 도달하는가":
        "Pharmacokinetics\nDoes it reach the site of action?",
    "안전성\n감당할 수 있는\n독성인가": "Safety\nIs the toxicity\nmanageable?",
    "물질생산\n순도와 경제성을 확보했는가":
        "Substance production\nPurity and economy secured?",
    "유효성\n의미 있는\n효과가 있는가": "Efficacy\nIs there a\nmeaningful effect?",
    "발굴부터 제4상까지 언제나 함께 살펴야 한다.":
        "They must be checked together at all times, from discovery to phase 4.",

    # ---------------------------------------------------------------- 유익성-위해성
    "순이익이\n최대인 지점": "Point of maximum\nnet benefit",
    "치료역 (therapeutic window)": "Therapeutic window",
    "용량 또는 농도": "Dose or concentration",
    "유익성 또는 위해성의 크기": "Size of the benefit or the risk",
    "유익성 (benefit)": "Benefit",
    "위해성 (risk)": "Risk",

    # ---------------------------------------------------------------- 역가와 효능
    "B가 더 낮은 농도에서 작용한다\n→ 역가(potency)는 B가 높다":
        "B acts at a lower concentration\n→ B is the more potent",
    "A는 더 큰 최대반응에 도달한다\n→ 효능(efficacy)은 A가 우수하다":
        "A reaches the larger maximum response\n→ A has the greater efficacy",
    "농도 (M)": "Concentration (M)",
    "반응 (임의 단위)": "Response (arbitrary units)",
    "약물 A": "Drug A",
    "약물 B": "Drug B",

    # ---------------------------------------------------------------- 확실성과 정보량
    "이 지점을 지나면\n자료는 폭증하지만\n확실성은 거의 늘지 않는다":
        "Beyond this point\ndata explode but\ncertainty barely grows",
    "개발 시간 또는 단계": "Development time or stage",
    "수준": "Level",
    "확실성 (certainty)": "Certainty",
    "정보량 (information)": "Information",

    # ---------------------------------------------------------------- 위험 인식의 편향
    "매우 드물지만\n극적인 사건": "Very rare but\ndramatic events",
    "중간 빈도의 사건": "Events of middling frequency",
    "흔하지만\n평범한 사건": "Common but\nordinary events",
    "실제보다\n과대평가": "Overestimated\nrelative to fact",
    "실제보다\n과소평가": "Underestimated\nrelative to fact",
    "실제 통계에 근거한 연간 사망자 수": "Actual annual deaths from statistics",
    "사람들이 추정한 연간 사망자 수": "Annual deaths as people estimate them",
    "정확한 판단 (기울기 1)": "Accurate judgment (slope 1)",
    "실제 판단 경향 (기울기 $<$ 1)": "Actual judgment (slope $<$ 1)",

    # ---------------------------------------------------------------- 자발적/비자발적 위험
    "같은 편익이라도\n수용되는 위험은\n약 1000배 차이":
        "At the same benefit\nthe accepted risk\ndiffers about 1000-fold",
    "흡연·음주 등\n스스로 택한 위험": "Smoking, drinking:\nrisks chosen oneself",
    "예방접종 등\n건강인에게 부과되는 위험": "Vaccination: risk\nimposed on the healthy",
    "사회가 얻는 편익 (연간 지출 규모)": "Benefit to society (annual expenditure)",
    "사회가 수용하는 위험 (연간 사망자 수)": "Risk society accepts (annual deaths)",
    "자발적 위험 (voluntary)": "Voluntary risk",
    "비자발적 위험 (involuntary)": "Involuntary risk",

    # ---------------------------------------------------------------- 등가위험
    "자동차로\n약 6,400 km 주행": "Driving about\n6,400 km",
    "담배\n100개비 흡연": "Smoking\n100 cigarettes",
    "암벽등반\n2시간": "Rock climbing\nfor 2 hours",
    "화학산업에서\n1년 근무": "A year working in\nthe chemical industry",
    "다음 네 가지 행위의 사망 위험은 서로 같은 수준이다":
        "The risk of death from these four activities is the same",
    "서로 다른 종류의 위험은 공통 척도로 환산해야 비교할 수 있다.\n"
    "환산하지 않은 채로는 '더 위험하다'는 말이 성립하지 않는다.":
        "Different kinds of risk can be compared only after conversion to a common scale.\n"
        "Without that conversion, saying that one is 'more dangerous' means nothing.",

    # ---------------------------------------------------------------- 더할 수 없는 숫자
    "○ ○ 면": "ANYTOWN",
    "설립": "Founded",
    "해발": "Altitude",
    "인구": "Population",
    "합계": "TOTAL",
    "년": "years",
    "명": "people",
    "단위와 의미가 다른 숫자는 더할 수 없다.\n숫자를 다룬다고 해서 모두 정량적 사고인 것은 아니다.":
        "Numbers with different units and meanings cannot be added.\n"
        "Handling numbers is not in itself quantitative thinking.",

    # ---------------------------------------------------------------- 학문 영역
    "약리학·약동학\n약력학": "Pharmacology\nPK and PD",
    "통계학": "Statistics",
    "수학": "Mathematics",
    "프로그래밍": "Programming",
    "PK-PD·임상시험 모델링과 시뮬레이션\n(pharmacometrics)":
        "PK-PD and clinical trial modeling\nand simulation (pharmacometrics)",
    "규제\n(Regulation)": "Regulation",
    "경영·경제\n(Business/Economics)": "Business and\nEconomics",

    # ---------------------------------------------------------------- 용량-반응 대 노출-반응
    "용량군 평균(굵은 선)은 단조 증가하지만\n같은 용량 안에서 반응이 크게 흩어진다":
        "The dose-group means (bold) rise monotonically,\n"
        "yet within a dose the response scatters widely",
    "투여 용량 (mg, 로그 눈금)": "Administered dose (mg, log scale)",
    "반응": "Response",
    "(가) 용량 – 반응": "(a) Dose-response",
    "같은 자료인데도 관계가 뚜렷해지고\nEmax 곡선이 그대로 드러난다":
        "With the same data the relation stands out\nand the Emax curve appears as it is",
    "실제 노출 AUC (임의 단위, 로그 눈금)": "Actual exposure AUC (arbitrary units, log scale)",
    "(나) 노출 – 반응": "(b) Exposure-response",

    # ---------------------------------------------------------------- 가능도구간
    "최대가능도의 1/15": "1/15 of the maximum likelihood",
    "최대가능도추정값": "Maximum likelihood estimate",
    "가능도구간 (": "Likelihood interval (",
    "): 비대칭": "): asymmetric",
    "대칭 Wald 신뢰구간 (": "Symmetric Wald interval (",
    "): 아래끝이 음수": "): lower limit negative",
    "모수 p": "Parameter p",
    "상대 가능도": "Relative likelihood",

    # ---------------------------------------------------------------- 여러 그림이 함께 쓰는 조각
    "제1상": "Phase 1",
    "제2상": "Phase 2",
    "제3상": "Phase 3",
}
