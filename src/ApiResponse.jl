#api_request_response container
module Response

import HttpCommon

type ApiResponse
  httpresponse::HttpCommon.Response
  _stats
  __str
  __parsed
ApiResponse(resp::HttpCommon.Response) = new(resp,nothing,nothing,nothing)
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
