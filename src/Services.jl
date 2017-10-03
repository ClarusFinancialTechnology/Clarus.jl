module Services
include("Response.jl")

import Requests

export api_request, api_key, api_secret, api_resource_path, api_savefile_path


mutable struct ApiConfig
  resource_path::String
  savefile_path::String
  key::String
  secret::String
  ApiConfig(key,secret) = new(defaultresourcepath(),defaultsavefilepath(),key,secret)
  ApiConfig(resource_path,key,secret) = new(resource_path,defaultsavepath(),key,secret)
  ApiConfig(resource_path,savefile_path,key,secret) = new(resource_path,savefile_path,key,secret)
end

function defaultresourcepath()
  root = Sys.is_windows() ? "c:/" : homedir()
  DEFAULT_RESOURCEPATH = joinpath(root,"clarusft","data","test")
  if !isdir(DEFAULT_RESOURCEPATH)
    error("Resource path does not exist: "*DEFAULT_RESOURCEPATH)
  end
  return DEFAULT_RESOURCEPATH
end

function defaultsavefilepath()
root = Sys.is_windows() ? "c:/" : homedir()
DEFAULT_SAVEPATH = joinpath(root,"clarusft","data","saved_data")
if !isdir(DEFAULT_SAVEPATH)
error("Save path does not exist: "*DEFAULT_SAVEPATH)
end
return DEFAULT_SAVEPATH
end

function keypath()
  root = Sys.is_windows() ? "c:/" : homedir()
  return joinpath(root,"clarusft","keys")
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

function requesterrormessage(r)
  errormessage     = get(r.headers,MESSAGES,"")  #If Kwargs are blank,
  errormessage   = string(errormessage,"\n",String(r.data)) #If function name is wrong.
end

function api_request(category, functionName; params...)
  urlBase = "https://" * _api_key!(credentials) * ":" * _api_secret!(credentials) * "@apieval.clarusft.com/api/rest/v1/"
  restUrl  =  urlBase * category * "/" * functionName * ".csv"
  r = Requests.post(restUrl, json=Dict(params))
  if Requests.statuscode(r)!=200
    error("Request to " * category * "/" * functionName * " failed with status code: " * string(Requests.statuscode(r))* "\n"*requesterrormessage(r))
  end
  return Response(r)
end

end #MODULE-END
