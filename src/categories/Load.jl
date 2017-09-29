module Load

import ..Clarus

function ladder(;params...)
  return Clarus.api_request("Load","Ladder";params...)
end

function market(;params...)
  return Clarus.api_request("Load","Market";params...)
end

function portfolio(;params...)
  return Clarus.api_request("Load","Portfolio";params...)
end

function scenario(;params...)
  return Clarus.api_request("Load","Scenario";params...)
end

end #MODULE-END
