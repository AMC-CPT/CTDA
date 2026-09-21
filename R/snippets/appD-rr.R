r9 <- sasLM::RR(e.t, n.t, e.c, n.c);  r9   # 각 연구의 RR, SE, 신뢰구간
thi <- log(r9$RR);  thi                    # 병합 위해 로그 변환
