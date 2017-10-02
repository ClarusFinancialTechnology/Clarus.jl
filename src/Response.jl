
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

function read(r::Response,  sink::Type=DataFrame, ; dateformat::Dates.DateFormat=Dates.ISODateFormat)
  return CSV.read(IOBuffer(r.httpresponse.data),sink;delim = ',', dateformat=dateformat)
end

function Base.print(io::IO, r::Response)
  return Base.print(dataframe!(r))
end

function dataframe!(r::Response)
  if isnull(r.dataframe)
    r.dataframe = read(r,DataFrame)
  end
  return get(r.dataframe)
end

function Base.show(io::IO, r::Response)
  return Base.show(dataframe!(r))
end

