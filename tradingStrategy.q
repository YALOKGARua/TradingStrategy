prices:flip `date`close!((2024.01.01 2024.01.02 2024.01.03 2024.01.04 2024.01.05 2024.01.06 2024.01.07 2024.01.08 2024.01.09 2024.01.10 2024.01.11); 100 102 101 104 107 106 109 111 113 115 116)
movingAvg: avg each prices`close@\:1+10
buySignal: prices`close > movingAvg
sellSignal: prices`close < movingAvg
signals:flip `date`buySignal`sellSignal!((2024.01.01 2024.01.02 2024.01.03 2024.01.04 2024.01.05 2024.01.06 2024.01.07 2024.01.08 2024.01.09 2024.01.10 2024.01.11); buySignal; sellSignal)
initialCapital: 10000
shares: 0
capitalHistory: enlist initialCapital
trades: enlist `buy
totalProfit: 0
tradeCount: 0

for i in 1 to count(prices) do {
    if buySignal[i] and initialCapital >= prices`close[i] {
        shares: initialCapital % prices`close[i]
        initialCapital: 0
        trades: trades, enlist (`buy`_prices`close[i])
    };
    if sellSignal[i] and shares > 0 {
        initialCapital: shares * prices`close[i]
        shares: 0
        trades: trades, enlist (`sell`_prices`close[i])
        totalProfit: totalProfit + (initialCapital - 10000)
        tradeCount: tradeCount + 1
    };
    capitalHistory: capitalHistory, enlist initialCapital + shares * prices`close[i]
}

finalCapital: last capitalHistory
summary: flip `finalCapital`totalProfit`tradeCount!((finalCapital); totalProfit; tradeCount)
