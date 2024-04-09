# Model Equations in Matrix Form

##### EX 1 ####
# Example 1: Estimating the parameters of the model for one population mean
ones <- matrix(1,nrow=6,ncol=1)
ones
y <- matrix(c(1,2,3,4,5,6),nrow=6,ncol=1)
y

# Estimate the model parameters
xty <- t(ones)%*%y
xtx <- t(ones)%*%ones
xtxinv <- solve(xtx)
ybar <- xtxinv%*%xty
ybar

# Compute the predicted values
pred.1 <- ones%*%ybar
pred.1

##### SKIP THIS PART FOR NOW (eX1), GO BACXK AT THE END ####

# This is the same as running a regression with y as the response and no predictor variables.
# This regression would have only an intercept, but no slope coefficient
model1 <- lm(y~1)
summary(model1)
model1$coefficients   # coefficients(model1) produces the same values
model1$fitted.values  # predict(model1) produces the same values


#### EX 2 ####
# Example 2: Estimating the parameters of the model for two population means
# (Means parameterization)
x1 <- matrix(c(1,1,1,0,0,0),6,1)
x2 <- matrix(c(0,0,0,1,1,1),6,1)
X <- cbind(x1,x2)
X

# Estimate the parameters of the model
Xty <- t(X)%*%y
XtX <- t(X)%*%X
XtXinv <- solve(XtX)
ybars <- XtXinv%*%Xty
ybars

# Compute the predicted values
pred.2a <- X %*% ybars
pred.2a

##### SKIP THIS PART FOR NOW (eX2), GO BACXK AT THE END ####

# This is the same as running a regression with y as the response and x1 and x2 as predictors, but no intercept
# The estimated coefficients of this model are the slopes of x1 and x2. No intercept is estimated.
model2a <- lm(y~-1+x1+x2)  # The "-1" estimates a model with no intercept
summary(model2a)
model2a$coefficients   # coefficients(model2a) produces the same values
model2a$fitted.values  # predict(model2a) produces the same values

