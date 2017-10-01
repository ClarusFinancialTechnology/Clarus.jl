#api_request_response container
module Response

import HttpCommon
import DataFrames
import CSV

using DataFrames: DataFrame

export ApiResponse, read

type ApiResponse
  httpresponse::HttpCommon.Response
  stats
  parsed::Nullable{DataFrame}
  ApiResponse(resp::HttpCommon.Response) = new(resp,nothing,Nullable{DataFrames.DataFrame}())
end

function text(r::ApiResponse)
  return String(r.httpresponse.data)
end

function data(r::ApiResponse)
  return r.httpresponse.data
end

function headers(r::ApiResponse)
  return r.httpresponse.headers
end

function status(r::ApiResponse)
  return r.httpresponse.status
end

function read(r::ApiResponse,  sink::Type=DataFrame)
  return CSV.read(IOBuffer(r.httpresponse.data),sink;delim = ',')
end

function Base.print(io::IO, r::ApiResponse)
  if isnull(r.parsed)
    r.parsed = Nullable(read(r,DataFrame))
  end
  return Base.print(get(r.parsed))
end

function Base.show(io::IO, r::ApiResponse)
  if isnull(r.parsed)
    r.parsed = Nullable(read(r,DataFrame))
  end
  return Base.show(get(r.parsed))
end
#Changes: look into the header to see if it is csv or tsv etc..
#Change the response to ApiResponse container

end #MODULE-END
