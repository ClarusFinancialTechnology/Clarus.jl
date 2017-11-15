module Hedge

import ..Clarus

function equivalents(;params...)
  return Clarus.api_request("Hedge","Equivalents";params...)
end

function equivalents01(;params...)
  return Clarus.api_request("Hedge","Equivalents01";params...)
end

end #MODULE-END
