module Services
include("Response.jl")

import Requests
export api_request, api_key, api_secret, api_resource_path, api_savefile_path, api_baseurl

outputtype = Dict(
:CSV  => "csv",
:TSV  => "tsv",
:JSON => "json",
:HTML => "html")


mutable struct ApiConfig
  default_outputtype::String
  resource_path::String
  savefile_path::String
  baseurl::String
  user_agent::String
  key::String
  secret::String
  ApiConfig(key,secret) = new(outputtype[:CSV],defaultresourcepath(),defaultsavefilepath(),defaultbaseurl(),defaultuseragent(),key,secret)
  ApiConfig(resource_path,key,secret) = new(outputtype[:CSV],resource_path,defaultsavepath(),defaultbaseurl(),defaultuseragent(),key,secret)
  ApiConfig(resource_path,savefile_path,key,secret) = new(outputtype[:CSV],resource_path,savefile_path,defaultbaseurl(),defaultuseragent(),key,secret)
end

function defaultresourcepath()
  root = Sys.is_windows() ? "c:/" : homedir()
  return joinpath(root,"clarusft","data","test")

end

function defaultsavefilepath()
root = Sys.is_windows() ? "c:/" : homedir()
return joinpath(root,"clarusft","data","test")
end

function defaultbaseurl()
  return "@eval.clarusft.com/api/rest/v1/"
end

function defaultuseragent()
  return "Clarus.jl"*string(Pkg.installed("Clarus"))*" "*"julia-requests"*string(Pkg.installed("Requests"))
end


function keypath()
  root = Sys.is_windows() ? "c:/" : homedir()
  return joinpath(root,"clarusft","keys")
end

const EMPTY           = ""
credentials           = ApiConfig(EMPTY,EMPTY)
const KEYFILE         = "API-Key.txt"
const SECRETFILE      = "API-Secret.txt"
const UTIL_SERVICE    = "Util"

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
  if length(filename) == 0
    return EMPTY
  end
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


function api_key(x)
  credentials.key = x
end

function api_secret(x)
  credentials.secret = x
end

function api_resource_path(x)
  credentials.resource_path = x
end

function api_savefile_path(x)
  credentials.savefile_path = x
end

function api_baseurl(x)
  credentials.baseurl = x
end

function requesterrormessage(r)
  errormessage   = get(r.headers,MESSAGES,"")  #If Kwargs are blank,
  errormessage   = string(errormessage,"\n",String(r.data)) #If function name is wrong.
  return errormessage
end

function url(category,functionName,output=credentials.default_outputtype)
  # urlBase = "https://" * _api_key!(credentials) * ":" * _api_secret!(credentials) * credentials.baseurl
  urlBase = "https://" * credentials.baseurl
  restUrl  =  urlBase * category * "/" * functionName * "."*output
  return restUrl
end

function api_request(category, functionName; params...)
  restUrl  = url(category,functionName)
  headers = Dict("Authorization"=>"Basic $(base64encode(_api_key!(credentials)*":"*_api_secret!(credentials)))")
  r = Requests.post(restUrl,headers=headers, json=Dict(params))
  if Requests.statuscode(r)!=200
    error("Request to " * category * "/" * functionName * " failed with status code: " * string(Requests.statuscode(r))* "\n"*requesterrormessage(r))
  end
  return Response(r)
end

end #MODULE-END
