# 📊 Export-Import Oil Time-Series Analysis

This document provides the key output and interpretation of the time-series and regression models applied to monthly Indian oil trade data.

---

## 📌 Dataset Overview

- **Time Period**: April 2016 onwards
- **Variables**:
  - `Oil Exports`, `Non-Oil Exports`
  - `Oil Imports`, `Non-Oil Imports`
  - Monthly frequency

---

## 📈 Linear Regression Results

### Model: `Oil Exports ~ Oil Imports`

- **Intercept**: 340.81  
- **Coefficient (Oil Imports)**: 0.3025  
- **R²**: 0.5903  
- **p-value for coefficient**: 1.26e-13 (***)

**Interpretation**:  
> Oil Exports increase significantly with Oil Imports. A 1 unit increase in Oil Imports is associated with a 0.30 unit increase in Oil Exports.

---

### Model: `Non-Oil Imports ~ Oil Imports`

- **Intercept**: 15520.27  
- **Coefficient (Oil Imports)**: 1.372  
- **R²**: 0.5230  
- **p-value for coefficient**: 1.49e-11 (***)

**Interpretation**:  
> Non-Oil Imports also rise with Oil Imports, indicating possible co-movements in trade volumes.

---

## 🔍 Residual Diagnostics

### Durbin-Watson Test

- **Oil Export Model**: DW = 1.79, p = 0.175 → *No strong autocorrelation*  
- **Non-Oil Import Model**: DW = 0.76, p < 0.001 → *Significant positive autocorrelation*

**Interpretation**:  
> Residuals in the Non-Oil Import model are autocorrelated, which violates OLS assumptions.

---

## 🔄 Decomposition of Oil Imports

### STL Decomposition Components

- **Trend**: General upward movement till 2022, followed by decline  
- **Seasonality**:  
  - Peaks: October–December  
  - Troughs: April–June

**Interpretation**:  
> Oil Imports show a clear seasonal pattern and trend, suitable for additive models.

---

## 🔮 Holt-Winters Forecast (12 months ahead)

### Last Forecast Point

- **April (next year)**:  
  - **Forecast** = 11,757.3  
  - **80% CI**: [7727.4, 15787.3]  
  - **95% CI**: [5594.0, 17920.6]

**Interpretation**:  
> Wide intervals reflect uncertainty in recent data, especially due to seasonality and recent volatility.

---

## 🔧 ARIMA Modeling (Non-Oil Imports)

### Final Model: ARIMA(1,1,1)(3,1,1)[12]

- **Log Likelihood**: -486.95  
- **AIC** = 987.91  
- **Ljung-Box test p-value** = 0.8285 → *No residual autocorrelation*

**Interpretation**:  
> This ARIMA model fits the data well and can be used for forecasting. No residual autocorrelation was detected, validating the model.

---

## ✅ Conclusion

- Oil Imports and Exports are strongly linearly related.
- Non-Oil Import model shows autocorrelation and needs time-series treatment.
- Seasonal decomposition and Holt-Winters smoothing highlight predictable cycles.
- ARIMA provides a reliable forecast for Non-Oil Imports.

---

**Note**: All analysis is conducted using R and appropriate time-series packages including `forecast`, `fpp2`, `lmtest`, and `ggplot2`.
