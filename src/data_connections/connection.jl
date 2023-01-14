using Dates
import YFinance
using DataFrames


"""
A Data Connection provides access to its respective API methods to retreive data
"""
abstract type DataSource end

abstract type Yahoo <: DataSource 
    # Yahoo API Connection
end


"""
prices(conn::Type{Yahoo}, ticker::AbstractString, start_dt::Date, end_dt::Date; interval::AbstractString="1d")::DataFrame
prices(conn::Type{Yahoo}, ticker::AbstractString; interval::AbstractString="1d", range::AbstractString="max")::DataFrame
prices(conn::Type{Yahoo}, tickers::Vector{String}, start_dt::Date, end_dt::Date; interval::AbstractString="1d")::DataFrame
prices(conn::Type{Yahoo}, tickers::Vector{String}; interval::AbstractString="1d", range::AbstractString="max")::DataFrame

Fetches prices from Yahoo Finance API
"""
function prices(conn::Type{Yahoo}, ticker::AbstractString, start_dt::Date, end_dt::Date; interval::AbstractString="1d")::DataFrame
    return YFinance.get_prices(ticker, startdt=start_dt, enddt=end_dt, exchange_local_time=true, interval=interval) |> DataFrame
end

function prices(conn::Type{Yahoo}, ticker::AbstractString; interval::AbstractString="1d", range::AbstractString="max")::DataFrame
    return YFinance.get_prices(ticker, range=range, exchange_local_time=true, interval=interval) |> DataFrame
end

function prices(conn::Type{Yahoo}, tickers::Vector{String}, start_dt::Date, end_dt::Date; interval::AbstractString="1d")::DataFrame
    data = YFinance.get_prices.(tickers, startdt=start_dt, enddt=end_dt, exchange_local_time=true, interval=interval)
    return vcat([DataFrame(i) for i in data]...)
end

function prices(conn::Type{Yahoo}, tickers::Vector{String}; interval::AbstractString="1d", range::AbstractString="max")::DataFrame
    data = YFinance.get_prices.(tickers, range=range, exchange_local_time=true, interval=interval)
    return vcat([DataFrame(i) for i in data]...)
end