# 01_data_preprocessing
rm(list = ls())
ExportImportOil <- read.csv("D:/sem5/Basic Econmetrics Lab/ExportImportOil.csv")
View(ExportImportOil)
head(ExportImportOil)


# 02_regression_analysis
library(stats)
model <- lm(Oil.Exports ~ Oil.Imports, data = ExportImportOil)
summary(model)

model1 <- lm(Non.Oil.Imports ~ Oil.Imports, data = ExportImportOil)
summary(model1)


# 03_residual_diagnostics
acf(model$residuals, type = "correlation")
pacf(model$residuals)

library(lmtest)
dwtest(model)
bgtest(model, order = 2)
bgtest(model, order = 3)
bgtest(model, order = 4)
dwtest(model1)


# 04_decomposition
data.ts <- ts(ExportImportOil$Oil.Imports, frequency = 12)
xlag1 <- stats::lag(data.ts, -1)
xlag2 <- stats::lag(data.ts, -2)
y <- cbind(data.ts, xlag1, xlag2)

ar1 <- lm(data.ts ~ xlag1, data = y)
summary(ar1)
plot(ar1$fit, ar1$residuals)
acf(ar1$residuals, xlim = c(1, 18))
ts.plot(data.ts, xlab = "Time Period", ylab = "Oil Imports", main = "Monthly Oil Imports")
plot(pacf(ExportImportOil$Oil.Imports, plot = FALSE), main = "Partial Autocorrelation Plot")
plot(acf(ExportImportOil$Oil.Imports, plot = FALSE), main = "Autocorrelation Plot")

decomp <- decompose(data.ts)
plot(decomp)
trendadj <- data.ts - decomp$trend
plot(decomp$trend)

# STL Decomposition
decomp1 <- stl(data.ts, s.window = "periodic")
plot(decomp1)
seasonal_stl_model1 <- decomp1$time.series[,1]
trend_stl_model1 <- decomp1$time.series[,2]
random_stl_model1 <- decomp1$time.series[,3]
seasadj1 <- data.ts - seasonal_stl_model1
trendadj1 <- data.ts - trend_stl_model1
plot(trendadj1)


# 05_holt_winters_forecasting
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

library(forecast)
forecast_output <- forecast:::forecast.HoltWinters(HW2, h = 12)
forecast_output
plot(forecast_output)


# 06_arima_modeling
library(urca)
library(fpp2)
library(ggplot2)

data.ts <- ts(ExportImportOil$Non.Oil.Imports, frequency = 12)
autoplot(data.ts)

data.ts %>% diff(lag = 12) %>% ggtsdisplay()
data.ts %>% diff(lag = 12) %>% diff() %>% ggtsdisplay()

fit4 <- Arima(data.ts, order = c(3,1,3), seasonal = c(0,1,1))
checkresiduals(fit4)

fit5 <- Arima(data.ts, order = c(1,1,1), seasonal = c(3,1,1))
summary(fit5)
checkresiduals(fit5)

ndiffs(data.ts)
nsdiffs(data.ts)
