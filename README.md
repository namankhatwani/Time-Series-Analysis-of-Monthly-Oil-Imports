# Export-Import Oil Time-Series Analysis

This repository contains R code and analysis for modeling and forecasting India's monthly oil and non-oil export-import data using regression, time-series decomposition, and ARIMA models.

---
## 📈 Dataset

- **File:** `ExportImportOil.csv`
- **Source:** Provided for academic use.
- **Variables:**
  - `Year`, `Month`, `Period`
  - `Oil.Exports`, `Non.Oil.Exports`
  - `Oil.Imports`, `Non.Oil.Imports`

---

## 🔧 Methods Used

### 1. **Regression Modeling**
- Simple linear regression of oil and non-oil trade flows.
- Diagnostic testing: Durbin-Watson, Breusch-Godfrey.

### 2. **Time Series Decomposition**
- Classical decomposition (`decompose`)
- STL decomposition (`stl`)

### 3. **Forecasting**
- Holt-Winters exponential smoothing
- ARIMA and seasonal ARIMA models (`Arima` from `forecast` package)

---

## 📦 Requirements

Install necessary R packages with:

```r
install.packages(c("forecast", "ggplot2", "zoo", "lmtest", "urca", "fpp2"))

