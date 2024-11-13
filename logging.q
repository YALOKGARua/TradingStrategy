logTrade: { date, action, price, capital, shares }
logFile: "trade_log.csv"

logTrade[`2024.01.01; "buy"; 100; 10000; 100] > logFile
logTrade[`2024.01.02; "sell"; 104; 10400; 0] > logFile
