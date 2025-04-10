# 📈 Export-Import Oil Data Analysis and Forecasting

This project performs a comprehensive time series analysis and forecasting on India's **Export and Import of Oil** data using R. The analysis includes linear regression, autocorrelation testing, time series decomposition, differencing, and Holt-Winters exponential smoothing for forecasting.

## 📁 Dataset

The dataset `ExportImportOil.csv` contains monthly data on:

- `Oil.Imports`
- `Oil.Exports`
- `Non.Oil.Imports`
- `Non.Oil.Exports`

Ensure the dataset is correctly placed and the path is updated in the script if necessary.

## 📦 Requirements

Install the following R packages if not already installed:

```r
install.packages("lmtest")
install.packages("forecast")
```
📊 Analysis Overview
🔹 Regression Analysis
Model 1: Oil.Exports ~ Oil.Imports

Model 2: Non.Oil.Imports ~ Oil.Imports

Conducts residual diagnostics using ACF, PACF, Durbin-Watson test, and Breusch-Godfrey test.

🔹 Time Series Decomposition
Converts Oil.Imports into a monthly time series.

Applies:

Classical Decomposition

STL Decomposition (Seasonal-Trend using Loess)

Extracts and plots trend, seasonal, and remainder components.

🔹 Differencing
Applies differencing techniques to make data stationary:

5th-order difference on Non.Oil.Exports

4th and 6th-order differences on STL trend-adjusted series

🔹 Holt-Winters Forecasting
Applies various configurations of Holt-Winters exponential smoothing:

Default configuration

Custom alpha values with/without trend and seasonality

Custom alpha, beta, gamma values

Forecasts oil imports for the next 12 months.
