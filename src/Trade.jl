module Trade

import ..Clarus

function convert(;params...)
  return Clarus.api_request("Trade","Convert";params...)
end

function price(;params...)
  return Clarus.api_request("Trade","Price";params...)
end

function cashflows(;params...)
  return Clarus.api_request("Trade","Cashflows";params...)
end

function validate(;params...)
  return Clarus.api_request("Trade","Validate";params...)
end

end #MODULE-END
