module Porto

using Dates
using DataFrames
using YFinance


include("data_connections/connection.jl")

export Yahoo, DataSource, prices

end # end of Porto Module
