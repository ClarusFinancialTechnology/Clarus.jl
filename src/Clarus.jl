module Clarus



#SUB-MODULES
include("Services.jl")
include("Resource.jl")
include(joinpath("categories","Ccp.jl"))
include(joinpath("categories","Compliance.jl"))
include(joinpath("categories","Credit.jl"))
include(joinpath("categories","Dates.jl"))
include(joinpath("categories","Etd.jl"))
include(joinpath("categories","Frtb.jl"))
include(joinpath("categories","Hedge.jl"))
include(joinpath("categories","Load.jl"))
include(joinpath("categories","Margin.jl"))
include(joinpath("categories","Market.jl"))
include(joinpath("categories","Mifid.jl"))
include(joinpath("categories","Portfolio.jl"))
include(joinpath("categories","ProfitLoss.jl"))
include(joinpath("categories","Risk.jl"))
include(joinpath("categories","Sdr.jl"))
include(joinpath("categories","Simm.jl"))
include(joinpath("categories","Trade.jl"))
include(joinpath("categories","Util.jl"))
include(joinpath("categories","Xva.jl"))
#

using Clarus.Services: api_key, api_request, api_secret, Response, dataframe!,drilldown,pivot
using Clarus.Resource: read,write


end #MODULE-END
