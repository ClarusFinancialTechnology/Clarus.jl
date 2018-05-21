module Xva

import ..Clarus

function fva(;params...)
  return Clarus.api_request("XVA","FVA";params...)
end

function mva(;params...)
  return Clarus.api_request("XVA","FVA";params...)
end

function mvaattribution(;params...)
  return Clarus.api_request("XVA","MVAAttribution";params...)
end

function sensitivity(;params...)
  return Clarus.api_request("XVA","Sensitivity";params...)
end

end #MODULE-END
