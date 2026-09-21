require(sasLM)
T3test(distance ~ age + Subject + age:Subject, Orthodont, H = "age", E = "age:Subject")
aov3(distance ~ age + Subject + age:Subject, Orthodont)
