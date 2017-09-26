module Clarus


import Requests
export api_request, api_key, api_secret

type ApiConfig
  key::String
  secret::String
end



function keypath()
  if Sys.is_windows()
    return joinpath("c:/","clarusft","keys")
  else
    return joinpath(homedir(),"clarusft","keys")
  end
end


const EMPTY           = ""
credentials           = ApiConfig(EMPTY,EMPTY)
const KEYFILE         = "API-Key.txt"
const SECRETFILE      =  "API-Secret.txt"

function _api_key!(c::ApiConfig)
  if length(c.key) == 0
    c.key = readCredentialFile(KEYFILE)
  end
  return c.key
end

function _api_secret!(c::ApiConfig)
  if length(c.secret) == 0
    c.secret = readCredentialFile(SECRETFILE)
  end
  return c.secret
end

function readCredentialFile(filename::String)
  filepath = joinpath(keypath(),filename)
  if isfile(filepath)
    f = open(filepath)
    try
      x = strip(readstring(f))
      return x
    finally
      close(f)
    end
  end
  return EMPTY
end


function api_key!(key)
  credentials.key = key
end

function api_secret!(secret)
  credentials.secret = secret
end


function api_request(category, functionName; params...)
  urlBase = "https://" * _api_key!(credentials) * ":" * _api_secret!(credentials) * "@apieval.clarusft.com/api/rest/v1/"
  restUrl  =  urlBase * category * "/" * functionName * ".csv"
  r = Requests.post(restUrl, json=Dict(params))
  if Requests.statuscode(r)!=200
    error("Request to " * category * "/" * functionName * " failed with status code: " * string(Requests.statuscode(r)))
  end
  return r
end

#SUB-MODULES
include("Simm.jl")
include("Margin.jl")
include("Credit.jl")
include("Xva.jl")
include("Frtb.jl")
include("Risk.jl")
include("Hedge.jl")
include("Profitloss.jl")
include("Portfolio.jl")
include("Market.jl")
include("Load.jl")
include("Compliance.jl")
include("Sdr.jl")
include("Dates.jl")
include("Util.jl")
include("Trade.jl")
#

end #MODULE-END
