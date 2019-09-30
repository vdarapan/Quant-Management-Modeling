library(lpSolveAPI)

# Heart Start Problem
HeartS<- make.lp(6, 8)

# Set Objective Function
set.objfn(HeartS, c(622, 614, 630, 0, 641, 645, 649, 0))

# Set values for the rows
set.row(HeartS, 1, c(1, 1, 1, 1), indices = c(1, 2, 3, 4))
set.row(HeartS, 2, c(1, 1, 1, 1), indices = c(5, 6, 7, 8))
set.row(HeartS, 3, c(1, 1), indices = c(1, 5))
set.row(HeartS, 4, c(1, 1), indices = c(2, 6))
set.row(HeartS, 5, c(1, 1), indices = c(3, 7))
set.row(HeartS, 6, c(1, 1), indices = c(4, 8))


# Set Right Hand side
rhs <- c(100, 120, 80, 60, 70, 10)
set.rhs(HeartS, rhs)

#set Constraint type
set.constr.type(HeartS, rep("=", 6), constraints = 1:6)

set.bounds(HeartS, lower = rep(0, 8))


# finally, name the decision variables (column) and constraints (rows)
lp.colNames <- c("AW1", "AW2", "AW3", "AW4", "BW1", "BW2", "BW3", "BW4")
lp.rowNames <- c("PlantA Capacity", "PlantB Capacity", "WH1 Demand", "WH2 Demand", "WH3 Demand", "WH4 Demand")
dimnames(HeartS) <- list(lp.rowNames, lp.colNames)

lp.control(HeartS, sense="min")

# view the linear program object to make sure it's correct
HeartS

solve(HeartS)
# -> A return value of 0 indicates that the model solved successfully.

#objective function value
get.objective(HeartS)

#Optimal decision Variable values
get.variables(HeartS)

#Constraints
get.constraints(HeartS)

# look at surplus for each constraint
get.constraints(HeartS) - rhs

#Identify sensitivity
get.sensitivity.rhs(HeartS)

get.dual.solution(HeartS)


