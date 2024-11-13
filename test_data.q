prices:flip `date`close!((2024.01.01 2024.01.02 2024.01.03); 100 105 110)
movingAvg: avg each prices`close@\:1+3
buySignal: prices`close > movingAvg
sellSignal: prices`close < movingAvg
