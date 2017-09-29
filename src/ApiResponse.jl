#api_request_response container
module Response

import Requests
import HttpCommon
import DataFrames

export ApiResponse

type ApiResponse
  httpresponse::HttpCommon.Response
  stats
  parsed::Nullable{DataFrames.DataFrame}
  ApiResponse(resp::HttpCommon.Response) = new(resp,nothing,Nullable{DataFrames.DataFrame}())
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
  if isnull(response.parsed)
    response.parsed = Nullable(DataFrames.readtable(IOBuffer(Requests.bytes(response.httpresponse));separator = ','))
  end
  return print(get(response.parsed))
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
