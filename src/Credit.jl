module Credit

import ..Clarus

function saccr(;params...)
  return Clarus.api_request("Credit","SACCR";params...)
end


end #MODULE-END
