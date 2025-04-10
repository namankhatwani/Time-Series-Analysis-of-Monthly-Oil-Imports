rm(list = ls())

ExportImportOil <- read.csv("D:/sem5/Basic Econmetrics Lab/ExportImportOil.csv")

View(ExportImportOil)
head(ExportImportOil)

library(stats)

model <- lm(Oil.Exports ~ Oil.Imports, data = ExportImportOil)
summary(model)

acf(model$residuals, type = "correlation")
pacf(model$residuals)

library(lmtest)

dwtest(model)

bgtest(model, order = 2)
bgtest(model, order = 3)
bgtest(model, order = 4)

model1 <- lm(Non.Oil.Imports ~ Oil.Imports, data = ExportImportOil)
summary(model1)

acf(model1$residuals, type = "correlation")
pacf(model1$residuals)

dwtest(model1)
bgtest(model, order = 2)
bgtest(model, order = 3)
bgtest(model, order = 4)

data.ts <- ts(ExportImportOil$Oil.Imports, frequency = 12)

xlag1 <- stats::lag(data.ts, -1)
xlag2 <- stats::lag(data.ts, -2)
y <- cbind(data.ts, xlag1, xlag2)

ar1 <- lm(data.ts ~ xlag1, data = y)
summary(ar1)

plot(ar1$fit, ar1$residuals)
acf(ar1$residuals, xlim = c(1, 18))

ts.plot(data.ts, xlab = "Time Period", ylab = "Oil Imports")

plot(pacf(ExportImportOil$Oil.Imports, plot = FALSE))
plot(acf(ExportImportOil$Oil.Imports, plot = FALSE))

decomp <- decompose(data.ts)
plot(decomp)

decomp$seasonal
decomp$trend
decomp$random

trendadj <- data.ts - decomp$trend

plot(decomp$trend)

decomp1 <- stl(data.ts, s.window = "periodic")
plot(decomp1)

seasonal_stl_model1 <- decomp1$time.series[, "seasonal"]
trend_stl_model1 <- decomp1$time.series[, "trend"]
random_stl_model1 <- decomp1$time.series[, "remainder"]

seasadj1 <- data.ts - seasonal_stl_model1
trendadj1 <- data.ts - trend_stl_model1
plot(trendadj1)

plot(pacf(ExportImportOil$Oil.Imports, plot = FALSE))
plot(acf(ExportImportOil$Non.Oil.Imports, plot = FALSE))

Diff1 <- diff(ExportImportOil$Non.Oil.Exports, differences = 5)
plot.ts(Diff1)

Diff11 <- diff(trendadj1, differences = 4)
plot.ts(Diff11)

Diff31 <- diff(trendadj1, differences = 6)
plot.ts(Diff31)

HW1 <- HoltWinters(data.ts)
plot(HW1)

HW11 <- HoltWinters(data.ts, alpha = 0.1, beta = FALSE, gamma = FALSE)
plot(HW11)

HW21 <- HoltWinters(data.ts, alpha = 0.8, gamma = FALSE)
plot(HW21)

HW31 <- HoltWinters(data.ts, alpha = 0.99)
plot(HW31)

HW2 <- HoltWinters(data.ts, alpha = 0.2, beta = 0.1, gamma = 0.1)
HW2$fitted

forecast_result <- forecast:::forecast.HoltWinters(HW2, h = 12)
plot(forecast_result)
