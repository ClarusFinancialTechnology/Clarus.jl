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




[![Build Status](https://travis-ci.org/ClarusFinancialTechnology/Clarus.jl.svg?branch=master)](https://travis-ci.org/ClarusFinancialTechnology/Clarus.jl)

[![Coverage Status](https://coveralls.io/repos/ClarusFinancialTechnology/Clarus.jl/badge.svg?branch=master&service=github)](https://coveralls.io/github/ClarusFinancialTechnology/Clarus.jl?branch=master)

[![codecov.io](http://codecov.io/github/ClarusFinancialTechnology/Clarus.jl/coverage.svg?branch=master)](http://codecov.io/github/ClarusFinancialTechnology/Clarus.jl?branch=master)
