#MODULE: SERVICES
import HttpCommon
import DataFrames
import CSV

using DataFrames: DataFrame

export Response, read, dataframe!, stats!, warnings, drilldown, pivot

#GLOBALS
const STATS        = "X-Clarus-Stats"
const WARNINGS     = "X-Clarus-Messages"
const MESSAGES     = "messages"

#REQUEST STATS
const GRID_TOTAL   = "GridTotal"
const REQUEST_ID   = "RequestId"
const GRID_ID      = "GridId"
const CALC_TIME    = "CalcTime"
const TASK_TIME    = "TaskTime"
const NUM_MTM      = "NumMTM"
const NUM_TRADES   = "NumTrades"
const NUM_WARNINGS = "NumWarnings"

#END-GLOBALS


mutable struct Response
  httpresponse::HttpCommon.Response
  stats::Nullable{Dict{String,String}}
  dataframe::Nullable{DataFrame}
  warnings::Nullable{Any}
  Response(r::HttpCommon.Response) = new(r,Nullable{Dict{String,String}}(),Nullable{DataFrames.DataFrame}())
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
  return Base.showall(dataframe!(r))
end

function dataframe!(r::Response)
  if isnull(r.dataframe)
    r.dataframe = Nullable(read(r,DataFrame))
  end
  return get(r.dataframe)
end

function Base.show(io::IO, r::Response)
  return Base.show(dataframe!(r))
end

function stats!(r::Response)
  if isnull(r.stats)
    head = r.httpresponse.headers
    if STATS in keys(head)
      d = Dict()
      for (i,s) in enumerate(split(head[STATS],';'))
          pair = split(s,'=')
          push!(d, strip(pair[1])=> strip(pair[2]))
      end
      r.stats = Nullable(d)
    else
      return Dict()
    end
  end
  return get(r.stats)
end



#getters

function stat!(r::Response,stat::String)
  return get(stats!(r),stat,nothing)
end

function total!(r::Response)
  return stat!(r, GRID_TOTAL)
end

function requestid!(r::Response)
  return stat!(r,REQUEST_ID)
end

function gridid!(r::Response)
  return stat!(r,GRID_ID)
end
function warnings!(r::Response)
  if isnull(r.warnings)
    r.warnings = Nullable(get(r.httpresponse.headers,WARNINGS,nothing))
  end
  return r.warnings
end





function pivot(grid::Response,rowAxis="Currency",colAxis="SubType",ccy="USD",view="Latest",output=credentials.default_outputtype)
  return Response(gridrequest(("GridId"=>gridid!(grid),"Row"=>rowAxis,"Col"=>colAxis,"reportCcy"=>ccy,"View"=>view),output))
end

function drilldown(grid::Response,row="Total",col="Total",view="Default",output=credentials.default_outputtype)
  return Response(gridrequest(("GridId"=>gridid!(grid),"DrilldownRow"=>row,"DrilldownCol"=>col,"DrilldownView"=>view),output))
end

function gridrequest(params,output=credentials.default_outputtype)
  headers = ("Content-Type"=>"application/json","User-Agent"=>credentials.user_agent)
  return Requests.post(url(UTIL_SERVICE,"Grid",output),json = Dict(params),headers = Dict(headers))
end
