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
  ApiConfig() = new(EMPTY,EMPTY,EMPTY,EMPTY,EMPTY,EMPTY,EMPTY)
  ApiConfig(key,secret) = new(outputtype[:CSV],defaultresourcepath(),defaultsavefilepath(),defaultbaseurl(),defaultuseragent(),key,secret)
  ApiConfig(resource_path,key,secret) = new(outputtype[:CSV],resource_path,defaultsavepath(),defaultbaseurl(),defaultuseragent(),key,secret)
  ApiConfig(resource_path,savefile_path,key,secret) = new(outputtype[:CSV],resource_path,savefile_path,defaultbaseurl(),defaultuseragent(),key,secret)
end

function defaultresourcepath()
  if haskey(ENV,"CHARM_RESOURCE_PATH")
    return ENV["CHARM_RESOURCE_PATH"]
  else
    root = Sys.is_windows() ? "c:/" : homedir()
    return joinpath(root,"clarusft","data","test")
  end
end

function defaultsavefilepath()
root = Sys.is_windows() ? "c:/" : homedir()
return joinpath(root,"clarusft","data","test")
end

function defaultbaseurl()
  if haskey(ENV,"CHARM_API_URL")
    return ENV["CHARM_API_URL"]
  else
    return "@eval.clarusft.com/api/rest/v1/"
  end
end

function defaultuseragent()
  return "Clarus.jl"*string(Pkg.installed("Clarus"))*" "*"julia-requests"*string(Pkg.installed("Requests"))
end


function keypath()
  root = Sys.is_windows() ? "c:/" : homedir()
  return joinpath(root,"clarusft","keys")
end

const EMPTY           = ""
credentials           = ApiConfig()
credentials_init      = false
const KEYFILE         = "API-Key.txt"
const SECRETFILE      = "API-Secret.txt"
const UTIL_SERVICE    = "Util"

function __init_credentials!__(credentials_init)
  if credentials_init == true
    return
  else
    global credentials = ApiConfig(EMPTY,EMPTY)
    credentials_init=true
    _api_key!(credentials)
    _api_secret!(credentials)
  end
end
function _api_key!(c::ApiConfig)
  if length(c.key) == 0
    if haskey(ENV,"CHARM_API_KEY")
      c.key = ENV["CHARM_API_KEY"]
    else
      c.key = readCredentialFile(KEYFILE)
    end
  end
  return c.key
end

function _api_secret!(c::ApiConfig)
  if length(c.secret) == 0
    if haskey(ENV,"CHARM_API_SECRET")
      c.secret = ENV["CHARM_API_SECRET"]
    else
      c.secret = readCredentialFile(SECRETFILE)
    end
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
  __init_credentials!__(credentials_init)
  restUrl  = url(category,functionName)
  headers = Dict("Authorization"=>"Basic $(base64encode(_api_key!(credentials)*":"*_api_secret!(credentials)))")
  r = Requests.post(restUrl,headers=headers, json=Dict(params))
  if Requests.statuscode(r)!=200
    error("Request to " * category * "/" * functionName * " failed with status code: " * string(Requests.statuscode(r))* "\n"*requesterrormessage(r))
  end
  return Response(r)
end

end #MODULE-END
