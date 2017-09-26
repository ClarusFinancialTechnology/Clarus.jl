module Simm

import ..Clarus

function backtest(;params...)
  return Clarus.api_request("SIMM","BackTest";params...)
end

function impact(;params...)
  return Clarus.api_request("SIMM","Impact";params...)
end

function margin(;params...)
  return Clarus.api_request("SIMM","Margin";params...)
end

function sensitivity(;params...)
  return Clarus.api_request("SIMM","Sensitivity";params...)
end

end #MODULE-END
