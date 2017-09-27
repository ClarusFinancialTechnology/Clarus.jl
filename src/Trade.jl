module Trade

import ..Clarus

function convert(;params...)
  return Clarus.Services.api_request("Trade","Convert";params...)
end

function price(;params...)
  return Clarus.Services.api_request("Trade","Price";params...)
end

function cashflows(;params...)
  return Clarus.Services.api_request("Trade","Cashflows";params...)
end

function validate(;params...)
  return Clarus.Services.api_request("Trade","Validate";params...)
end

end #MODULE-END
