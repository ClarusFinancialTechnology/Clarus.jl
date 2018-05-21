module ProfitLoss

import ..Clarus

function hypothetical(;params...)
  return Clarus.api_request("ProfitLoss","Hypothetical";params...)
end

function predict(;params...)
  return Clarus.api_request("ProfitLoss","Predict";params...)
end

end #MODULE-END
