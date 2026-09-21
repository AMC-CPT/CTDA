# 탈락 보정: 분석에 필요한 군당 수(약 86)를 탈락률 15%에 맞춰 등록 수로 부풀린다
n_analyzed <- 86;  pdrop <- 0.15
ceiling(n_analyzed / (1 - pdrop))    # 등록해야 할 군당 수
