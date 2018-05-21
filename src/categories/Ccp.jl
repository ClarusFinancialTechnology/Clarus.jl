module Ccp

import ..Clarus

function defaultresources(;params...)
  return Clarus.api_request("CCP","DefaultResources";params...)
end


end #MODULE-END
