module Util

import ..Clarus

function activity(;params...)
  return Clarus.api_request("Util","Activity";params...)
end

function tickers(;params...)
  return Clarus.api_request("Util","Tickers";params...)
end

function periodlength(;params...)
  return Clarus.api_request("Util","PeriodLength";params...)
end

function grid(;params...)
  return Clarus.api_request("Util","Grid";params...)
end

function domain(;params...)
  return Clarus.api_request("Util","Domain";params...)
end

end #MODULE-END
