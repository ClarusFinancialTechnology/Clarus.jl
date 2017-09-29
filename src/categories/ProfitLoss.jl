module ProfitLoss

import ..Clarus

function predict(;params...)
  return Clarus.api_request("ProfitLoss","Predict";params...)
end

end #MODULE-END
