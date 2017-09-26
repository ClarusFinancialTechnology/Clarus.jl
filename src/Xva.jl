module Xva

import ..Clarus

function fva(;params...)
  return Clarus.api_request("XVA","FVA";params...)
end

function mva(;params...)
  return Clarus.api_request("XVA","FVA";params...)
end

end #MODULE-END
