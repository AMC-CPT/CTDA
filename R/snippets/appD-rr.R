r9 <- sasLM::RR(e.t, n.t, e.c, n.c);  r9   # RR, SE and CI of each study
thi <- log(r9$RR);  thi                    # log-transformed for pooling
