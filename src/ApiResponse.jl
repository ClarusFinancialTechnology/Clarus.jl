#api_request_response container
module Response

import Requests
import HttpCommon
import DataFrames

export ApiResponse

type ApiResponse
  httpresponse::HttpCommon.Response
  stats
  parsed
  ApiResponse(resp::HttpCommon.Response) = new(resp,nothing,nothing)
end

function text(response::ApiResponse)
  return String(response.httpresponse.data)
end

function data(response::ApiResponse)
  return response.httpresponse.data
end

function headers(response::ApiResponse)
  return response.httpresponse.headers
end

function status(response::ApiResponse)
  return response.httpresponse.status
end

function Base.print(response::ApiResponse)
  if response.parsed == nothing
    response.parsed = DataFrames.readtable(IOBuffer(Requests.bytes(response.httpresponse));separator = ',')
  end
  return print(response.parsed)
end

#sets


#end-sets

#getters
#=
function text(response::ApiResponse)
  return response.httpresponse.text
end

function results(response::ApiResponse)
  return response.httpresponse
end

function


#end-getters=#

end #MODULE-END
