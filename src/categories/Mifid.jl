module Mifid

import ..Clarus

function dsb(;params...)
  return Clarus.api_request("MIFID","DSB";params...)
end

function firds(;params...)
  return Clarus.api_request("MIFID","FIRDS";params...)
end

end #MODULE-END
