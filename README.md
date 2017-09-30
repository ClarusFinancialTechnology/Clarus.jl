# Clarus
A Julia library for [Clarus Microservices API](https://www.clarusft.com/products/microservices/).
### Installation
```julia
julia> Pkg.add("Clarus")
```
### Example Usage
```julia
julia> import Clarus
julia> print(Clarus.Trade.price(trade="USD 10Y 100m pay 2.1%"))
```




















[![Build Status](https://travis-ci.org/liamhenry/Clarus.jl.svg?branch=master)](https://travis-ci.org/liamhenry/Clarus.jl)

[![Coverage Status](https://coveralls.io/repos/liamhenry/Clarus.jl/badge.svg?branch=master&service=github)](https://coveralls.io/github/liamhenry/Clarus.jl?branch=master)

[![codecov.io](http://codecov.io/github/liamhenry/Clarus.jl/coverage.svg?branch=master)](http://codecov.io/github/liamhenry/Clarus.jl?branch=master)
