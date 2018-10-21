import numpy
import pandas as pd

print(numpy.arange(3))

def test_run():
    # download stock historical data from Yahoo
    #  https://finance.yahoo.com/quote/AAPL/history?p=AAPL
    df = pd.read_csv("AAPL.csv")
    print(df)

if __name__ == "__main__":
    test_run()
