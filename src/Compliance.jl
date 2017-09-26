module Compliance

import ..Clarus


function clearingeligible(;params...)
  return Clarus.api_request("Compliance","ClearingEligible";params...)
end

function clearingmandatory(;params...)
  return Clarus.api_request("Compliance","ClearingMandatory";params...)
end

function sefmandatory(;params...)
  return Clarus.api_request("Compliance","SEFMandatory";params...)
end

end #MODULE-END
