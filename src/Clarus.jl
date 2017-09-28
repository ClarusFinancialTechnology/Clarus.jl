module Clarus



#SUB-MODULES
include("Services.jl")
include("Simm.jl")
include("Margin.jl")
include("Credit.jl")
include("Xva.jl")
include("Frtb.jl")
include("Risk.jl")
include("Hedge.jl")
include("ProfitLoss.jl")
include("Portfolio.jl")
include("Market.jl")
include("Load.jl")
include("Compliance.jl")
include("Sdr.jl")
include("Dates.jl")
include("Util.jl")
include("Trade.jl")
include("Resource.jl")
#

using Clarus.Services: api_key!, api_request, api_secret!
using Clarus.Resource: read 

end #MODULE-END
