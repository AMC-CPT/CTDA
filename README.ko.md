# 임상시험에서의 과학적 추론 with R: 예제 저장소

*An English description is in [README.md](README.md).*

배균섭, 『임상시험에서의 과학적 추론 with R』(Scientific Inference in Clinical Trials
with R)의 companion 저장소다. 책에 실린 **모든 숫자와 그림을 독자가 다시 만들 수 있게**
하는 것이 목적이며, 책 본문은 여기 없다.

필요한 것은 R 하나뿐이다. 상용 소프트웨어도, 라이선스도 필요 없다.

**여기 실린 코드는 영문판의 것이다.** 스니펫의 주석, 얼린 출력의 생략 표시, 그림의
라벨이 모두 영어다. 한국어판 책은 같은 코드를 한글 주석으로 싣는다. 파일 이름과 장
번호, 콘솔 출력의 숫자, 자료는 언어와 무관하므로 어느 판의 독자든 이 저장소를 그대로
쓸 수 있다. 찾을 곳을 하나로 두려고 코드는 한 벌만 싣는다.

## 시작하기

```sh
git clone https://github.com/AMC-CPT/CTDA
cd CTDA
Rscript R/build-all.R
```

`output/` 의 콘솔 출력과 `figures/` 의 그림이 다시 만들어진다. 이미 커밋되어 있으므로
돌리지 않고 그대로 읽어도 된다. 한 장만 보려면 `R/snippets/` 에서 그 장의 파일을 열어
직접 실행한다.

얼리는 일은 `R/build.R` 이 하고 `R/build-all.R` 은 그것을 부른다. 다른 점은 `ch17-*`
스니펫(책의 20장) 하나로, 그 비선형 적합은 그룹마다 새 R 프로세스가 필요하다(까닭은
`R/build-all.R` 머리 주석에 있다). 한 장만 다시 만들 때는 `R/build.R` 을 쓴다.

## 구조

```
R/snippets/<name>.R   본문에 실리는 R 코드의 원본. 401개
R/build.R             snippets 를 차례로 돌려 output/ 과 figures/ 를 만든다
R/build-all.R         같은 일을 하되 ch17-* 스니펫은 그룹마다 새 R 프로세스로 돌린다
R/_freeze.R           그 도우미 (seed 고정, 세션 공유, 출력 정리)
output/<name>.txt     얼린 콘솔 출력 (책에 실린 그대로). 339개
figures/<name>.pdf    얼린 그림. 91개
data/                 실습 자료
pyfig/                1·2장 도해의 matplotlib 스크립트와 FIGURE-PROVENANCE.md
```

스니펫 이름의 번호는 인쇄된 책의 장 번호가 **아니다.** 이름은 원고 파일의 번호를 따르며,
그 번호는 장을 더하고 옮길 때 바뀌지 않았다. 책이 스니펫을 이 이름으로 부르므로 그대로
둔다. 파일 묶음마다 책의 몇 장에 실리는지는 다음과 같다.

| 파일 | 책의 장 |
|---|---|
| `qdm-*` | 1, 2 |
| `ch02-*` | 3 |
| `ch03-*` | 4 |
| `ch04-*` | 5 |
| `ch05-*` | 6 |
| `ch06-*` | 7 |
| `ch07-*` | 8 |
| `ch08-*` | 6, 7, 11, 18 (옛 장 하나의 절들이 흩어진 것) |
| `ch09-*` | 10 |
| `ch10-*` | 11 |
| `ch11-*` | 12 |
| `ch12-*` | 13 |
| `ch13-*` | 14 |
| `ch14-*` | 15 |
| `ch15-*` | 16 |
| `ch16-*`, `ch16b-*` | 17 |
| `ss-*` | 18 |
| `ctsim-*` | 19 |
| `ch17-*` | 20 |
| `be-*` | 21 |
| `appA-*` ~ `appE-*` | 부록 A ~ E |

9·22·23장은 코드를 본문에 직접 싣고 24장에는 코드가 없어 여기에 파일이 없다.
`R/build.R` 과 `R/build-all.R` 의 주석도 파일과 같은 번호로 장을 부른다. 그 주석의
17장은 `ch17-*` 파일, 곧 책의 20장이다.

`pyfig/` 의 스크립트는 한국어판의 것이며, 라벨을 그릴 때마다 `pyfig/labels_en.py` 의
사전으로 옮긴다. 그래서 그 파일들의 주석만 한글로 남아 있다. `CTDA_LANG` 이 언어를
고르고 여기서는 기본이 영어이므로, 그대로 돌리면 `figures/` 의 그림이 다시 만들어진다.

## 코드와 출력이 어긋나지 않는 이유

책은 `R/snippets/<name>.R` 을 **파일째** 싣고, 그 파일을 실행해 얻은 출력을
`output/<name>.txt` 에서 읽는다. 코드와 출력이 같은 원본에서 나오므로 손으로 옮겨 적다
생기는 어긋남이 없다. `R/build.R` 이 그 고정(freeze) 과정이고, `R/_freeze.R` 이 난수 seed
와 세션을 관리한다.

스니펫은 **한 R 세션을 이어 쓰는 것처럼** 순서대로 돈다. 앞 스니펫이 만든 객체를 뒤
스니펫이 그대로 쓴다. 그래서 한 파일만 따로 돌리면 객체가 없다는 오류가 날 수 있다.
그럴 때는 같은 장의 앞 스니펫부터 차례로 돌린다(`R/build.R` 의 순서가 그 순서다).

## 필요한 R 패키지

base R 로 도는 것이 대부분이고, 장에 따라 다음이 필요하다.

```r
install.packages(c("sasLM", "MASS", "survival", "nlme", "lattice", "psych", "nnet",
                   "car", "gmodels", "PropCIs", "KMsurv", "ggplot2", "ggsurvfit",
                   "dobson", "rgl", "mathr", "flexsurv", "numDeriv", "wnl", "nmw",
                   "deSolve", "LBI", "vcdExtra", "meta"))
```

`mathr` 도 CRAN 에 있다. 개발판은 <https://github.com/ksbae/mathr> 에 있다.

## 자료의 출처

`data/` 의 자료는 모두 저자의 자료이거나 공개 통계다. 원래 `http://r.acr.kr/` 에
공개되어 있던 것을 원격 의존 없이 돌아가도록 저장소 안에 묶었다.

| 파일 | 내용 |
|---|---|
| `2017KoBody.csv` | 2017 국민체력실태조사 (원자료: `http://r.acr.kr/2017KoBody.csv`) |
| `LogP-F.csv` | 저자가 공개자료에서 취합한 45개 약물의 LogP 와 경구 생체이용률 |
| `Paxlovid.csv`, `pax0.csv` | 생존분석 예제 자료 |
| `ExTTE.csv`, `TTE.R` | 사건까지의 시간 예제와 그 도우미 함수 |
| `Surv-Trt.csv`, `Surv-Quartile.csv` | 생존분석 예제 |
| `bax.csv` | 용량--반응 예제 (수축기혈압 변화, 기저치, eGFR) |
| `Dose-ContResp.csv`, `Dose-Resp-Logistic.csv`, `AUC-Resp-Logistic.csv`, `DoseRes.csv`, `Pop-SigEmax.csv` | 용량·노출--반응 예제 |

1·2장 도해의 출처와 저작권 처리는 `pyfig/FIGURE-PROVENANCE.md` 에 그림 하나하나 적혀
있다. 제3자 도판은 한 장도 쓰지 않았다.

## 연습문제 해답

책에는 싣지 않았고 이 저장소에도 없다. 교수자는 `ksbae@acr.kr` 로 요청한다.

## 저작권과 라이선스

책 본문의 저작권은 저자와 출판사에 있고 여기에는 본문이 없다. 이 저장소의 코드, 자료,
얼린 출력과 그림은 **GNU General Public License v3.0 또는 그 이후 판**으로 공개한다
(`LICENSE`). 돌려 보고 고쳐 쓰는 것은 자유이며, 고친 것을 배포할 때는 같은 조건으로
소스를 함께 내놓는다.

Copyright (C) 2026 Kyun-Seop Bae. This program is free software: you can redistribute it
and/or modify it under the terms of the GNU General Public License as published by the
Free Software Foundation, either version 3 of the License, or (at your option) any later
version. It is distributed WITHOUT ANY WARRANTY; see `LICENSE` for details.

## 같은 시리즈의 다른 companion 저장소

- 1권 『과학 계산 with R』: <https://github.com/AMC-CPT/SciCompR>
- 3권 『약동학 with R』: <https://github.com/AMC-CPT/PKwR>
- 4권 『계량약리학 with NONMEM and R』: <https://github.com/AMC-CPT/PMx>
- 5권 『신약임상개발』: <https://github.com/AMC-CPT/CDD>
