module Market

import ..Clarus
function caplets(;params...)
  return Clarus.api_request("Market","Caplets";params...)
end

function curveusage(;params...)
  return Clarus.api_request("Market","CurveUsage";params...)
end

function df(;params...)
  return Clarus.api_request("Market","DF";params...)
end

function fixings(;params...)
  return Clarus.api_request("Market","Fixings";params...)
end

function futures(;params...)
  return Clarus.api_request("Market","Futures";params...)
end

function fxrates(;params...)
  return Clarus.api_request("Market","FXRates";params...)
end

function pardv01(;params...)
  return Clarus.api_request("Market","ParDV01";params...)
end

function parrates(;params...)
  return Clarus.api_request("Market","ParRates";params...)
end

function zerorates(;params...)
  return Clarus.api_request("Market","ZeroRates";params...)
end

end #MODULE-END
