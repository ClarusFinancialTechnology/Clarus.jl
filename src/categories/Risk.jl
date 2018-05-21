module Risk

import ..Clarus

function dv01(;params...)
  return Clarus.api_request("Risk","DV01";params...)
end

function fxdelta(;params...)
  return Clarus.api_request("Risk","FXDelta";params...)
end

function fxvega(;params...)
  return Clarus.api_request("Risk","FXVega";params...)
end

function irdelta(;params...)
  return Clarus.api_request("Risk","IRDelta";params...)
end

function irgamma(;params...)
  return Clarus.api_request("Risk","IRGamma";params...)
end

function irvega(;params...)
  return Clarus.api_request("Risk","IRVega";params...)
end

function stress(;params...)
  return Clarus.api_request("Risk","Stress";params...)
end

function theta(;params...)
  return Clarus.api_request("Risk","Theta";params...)
end

function var(;params...)
  return Clarus.api_request("Risk","VaR";params...)
end

function varattribution(;params...)
  return Clarus.api_request("Risk","VaRAttribution";params...)
end

function varvectors(;params...)
  return Clarus.api_request("Risk","VaRVectors";params...)
end

end #MODULE-END
