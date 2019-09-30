library(lpSolveAPI)

# Oil Refinery Problem
OilR <- make.lp(9, 27)

# Set Objective Function
set.objfn(OilR, c(1.52, 1.60, 1.40, 1.70, 1.63, 1.55, 1.45, 1.57, 1.30, 5.15, 5.69, 6.13, 5.63, 5.80, 0, 5.12, 5.47, 6.05, 6.12, 5.71, 0, 5.32, 6.16, 6.25, 6.17, 5.87, 0))

# Set values for the rows
set.row(OilR, 1, c(1, 1, 1), indices = c(1, 2, 3))
set.row(OilR, 2, c(1, 1, 1), indices = c(4, 5, 6))
set.row(OilR, 3, c(1, 1, 1), indices = c(7, 8, 9))
set.row(OilR, 4, c(1, 1, 1), indices = c(10, 16, 22))
set.row(OilR, 5, c(1, 1, 1), indices = c(11, 17, 23))
set.row(OilR, 6, c(1, 1, 1), indices = c(12, 18, 24))
set.row(OilR, 7, c(1, 1, 1), indices = c(13, 19, 25))
set.row(OilR, 8, c(1, 1, 1), indices = c(14, 20, 26))
set.row(OilR, 9, c(1, 1, 1), indices = c(15, 21, 27))


# Set Right Hand side
rhs <- c(93, 88, 95, 30, 57, 48, 91, 48, 2)
set.rhs(OilR, rhs)

#set Constraint type
set.constr.type(OilR, rep("=", 9), constraints = 1:9)

set.bounds(OilR, lower = rep(0, 27))


# Names for the decision variables (column) and constraints (rows)
lp.colNames <- c("W1P1", "W1P2", "W1P3", "W2P1", "W2P2", "W2P3", "W3P1", "W3P2", "W3P3", "P1R1", "P1R2", "P1R3", "P1R4", "P1R5", "P1R6", "P2R1", "P2R2", "P2R3", "P2R4", "P2R5", "P2R6", "P3R1", "P3R2", "P3R3", "P3R4", "P3R5", "P3R6")
lp.rowNames <- c("ROW1", "ROW2", "ROW3", "ROW4", "ROW5", "ROW6", "ROW7", "ROW8", "ROW9" )
dimnames(OilR) <- list(lp.rowNames, lp.colNames)

lp.control(OilR, sense="min")

# checking whether the linear program object is correct
OilR

# solve the model
solve(OilR)
# -> A return value of 0 indicates that the model was successfully solved.

#objective function value
get.objective(OilR)

#Optimal decision Variable values
get.variables(OilR)

#Constraints
get.constraints(OilR)

# look at surplus for each constraint
get.constraints(OilR) - rhs

#Identify sensitivity
get.sensitivity.rhs(OilR)

get.dual.solution(OilR)

