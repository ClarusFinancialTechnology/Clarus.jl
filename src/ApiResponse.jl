#api_request_response container
module Response

import HttpCommon
import DataFrames
import CSV

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
    response.parsed = Nullable(CSV.read(IOBuffer(response.httpresponse.data);delim = ','))
  end
  return print(get(response.parsed))
end

#Changes: look into the header to see if it is csv or tsv etc..
#Change the response to ApiResponse container

end #MODULE-END
