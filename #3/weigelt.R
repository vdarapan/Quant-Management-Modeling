### Weigelt Production

library(lpSolveAPI)

lprec <- read.lp("/Users/dvk/Desktop/FALL-19/Quant/Assignments/#3/weigelt.lp")

# Set Right Hand side
rhs <- c(750, 900, 450, 13000, 12000, 5000, 900, 1200, 750, 0 , 0)
set.rhs(lprec, rhs)

#set Constraint type
set.constr.type(lprec, rep("<=", 9), constraints = 1:9)
set.constr.type(lprec, rep("=", 2), constraints = 10:11)

set.bounds(lprec, lower = rep(0, 9))

solve(lprec)

get.objective(lprec)

get.variables(lprec)

get.constraints(lprec)

#Identify sensitivity
get.sensitivity.rhs(lprec)

get.dual.solution(lprec)

get.sensitivity.obj(lprec)

#Range of Shadow Prices and reduced cost
cbind(get.sensitivity.rhs(lprec)$duals[1:11], get.sensitivity.rhs(lprec)$dualsfrom[1:11], get.sensitivity.rhs(lprec)$dualstill[1:11])

cbind(get.sensitivity.rhs(lprec)$duals[12:20], get.sensitivity.rhs(lprec)$dualsfrom[12:20], get.sensitivity.rhs(lprec)$dualstill[12:20])



