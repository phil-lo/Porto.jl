using Porto
using Test

@testset "Porto.jl" begin
    @test Yahoo <: DataSource
end

@testset "DataConnection Tests" begin
    @test begin 
        px_aapl = prices(Yahoo, "AAPL")
        price = px_aapl[1, :close]
        round(price, digits=3) == 0.11
    end
    @test begin 
        px_aapl = prices(Yahoo, ["AAPL", "MSFT"])
        id = px_aapl[1, :ticker]
        id == "AAPL"
    end
end
