module Etd

import ..Clarus

function etdim(;params...)
  return Clarus.api_request("ETD","ETDIM";params...)
end


end #MODULE-END
