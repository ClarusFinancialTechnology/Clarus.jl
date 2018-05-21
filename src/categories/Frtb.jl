module Frtb

import ..Clarus

function ima(;params...)
  return Clarus.api_request("FRTB","IMA";params...)
end

function imaimpact(;params...)
  return Clarus.api_request("FRTB","IMAImpact";params...)
end

function modellablerf(;params...)
  return Clarus.api_request("FRTB","ModellableRF";params...)
end

function modellablerftrades(;params...)
  return Clarus.api_request("FRTB","ModellableRFTrades";params...)
end

function plvectors(;params...)
  return Clarus.api_request("FRTB","PLVectors";params...)
end

function sa(;params...)
  return Clarus.api_request("FRTB","SA";params...)
end

function saimpact(;params...)
  return Clarus.api_request("FRTB","SAImpact";params...)
end


end #MODULE-END
