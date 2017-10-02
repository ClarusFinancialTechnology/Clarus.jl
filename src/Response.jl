#api_request_response container
import HttpCommon
import DataFrames
import CSV

using DataFrames: DataFrame

export Response, read, dataframe

type Response
  httpresponse::HttpCommon.Response
  stats
  dataframe::Nullable{DataFrame}
  Response(r::HttpCommon.Response) = new(r,nothing,Nullable{DataFrames.DataFrame}())
end

function text(r::Response)
  return String(r.httpresponse.data)
end

function data(r::Response)
  return r.httpresponse.data
end

function headers(r::Response)
  return r.httpresponse.headers
end

function status(r::Response)
  return r.httpresponse.status
end

function read(r::Response,  sink::Type=DataFrame)
  return CSV.read(IOBuffer(r.httpresponse.data),sink;delim = ',')
end

function Base.print(io::IO, r::Response)
  if isnull(r.dataframe)
    r.dataframe = Nullable(read(r,DataFrame))
  end
  return Base.print(get(r.dataframe))
end

function dataframe!(r::Response)
  if isnull(r.dataframe)
    r.dataframe = read(r,DataFrame)
  end
  return get(r.dataframe)
end

function Base.show(io::IO, r::Response)
  if isnull(r.dataframe)
    r.dataframe = Nullable(read(r,DataFrame))
  end
  return Base.show(get(r.dataframe))
end
#Changes: look into the header to see if it is csv or tsv etc..
#Change the response to ApiResponse container
