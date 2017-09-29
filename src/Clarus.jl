module Clarus



#SUB-MODULES
include(joinpath("categories","Simm.jl"))
include(joinpath("categories","Margin.jl"))
include(joinpath("categories","Credit.jl"))
include(joinpath("categories","Xva.jl"))
include(joinpath("categories","Frtb.jl"))
include(joinpath("categories","Risk.jl"))
include(joinpath("categories","Hedge.jl"))
include(joinpath("categories","ProfitLoss.jl"))
include(joinpath("categories","Portfolio.jl"))
include(joinpath("categories","Market.jl"))
include(joinpath("categories","Load.jl"))
include(joinpath("categories","Compliance.jl"))
include(joinpath("categories","Sdr.jl"))
include(joinpath("categories","Dates.jl"))
include(joinpath("categories","Util.jl"))
include(joinpath("categories","Trade.jl"))
include("Resource.jl")
include("ApiResponse.jl")
include("Services.jl")
#

using Clarus.Services: api_key, api_request, api_secret
using Clarus.Resource: read
using Clarus.Response: ApiResponse

end #MODULE-END
