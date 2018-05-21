module Margin

import ..Clarus

function attribution(;params...)
  return Clarus.api_request("Margin","Attribution";params...)
end

function im(;params...)
  return Clarus.api_request("Margin","IM";params...)
end

function impact(;params...)
  return Clarus.api_request("Margin","Impact";params...)
end

function optimiser(;params...)
  return Clarus.api_request("Margin","Optimiser";params...)
end

function parswapsim(;params...)
  return Clarus.api_request("Margin","ParSwapsIM";params...)
end

function plvectors(;params...)
  return Clarus.api_request("Margin","PLVectors";params...)
end

function sensitivity(;params...)
  return Clarus.api_request("Margin","Sensitivity";params...)
end

function vm(;params...)
  return Clarus.api_request("Margin","VM";params...)
end

function vmbuffer(;params...)
  return Clarus.api_request("Margin","VMBuffer";params...)
end

function vmlsoc(;params...)
  return Clarus.api_request("Margin","VMLSOC";params...)
end

end #MODULE-END
