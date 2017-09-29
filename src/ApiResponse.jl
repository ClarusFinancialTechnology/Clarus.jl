#api_request_response container
module Response

import HttpCommon

export ApiResponse

type ApiResponse
  httpresponse::HttpCommon.Response
  _stats
  __str
  __parsed
ApiResponse(resp::HttpCommon.Response) = new(resp,nothing,nothing,nothing)
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
