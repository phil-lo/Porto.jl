using DataFrames
using CSV

function load_csv(filename::AbstractString)::DataFrame
    return CSV.read("data/$filename", DataFrame)
end

function write_csv(filename::AbstractString, df::DataFrame)::nothing
    CSV.write("data/$filename", df)
end
