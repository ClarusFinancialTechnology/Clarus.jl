module Portfolio

import ..Clarus

function cash(;params...)
  return Clarus.api_request("Portfolio","Cash";params...)
end

function cashbydate(;params...)
  return Clarus.api_request("Portfolio","CashByDate";params...)
end

function fixings(;params...)
  return Clarus.api_request("Portfolio","Fixings";params...)
end

function mtm(;params...)
  return Clarus.api_request("Portfolio","MTM";params...)
end

function notional(;params...)
  return Clarus.api_request("Portfolio","Notional";params...)
end

function summary(;params...)
  return Clarus.api_request("Portfolio","Summary";params...)
end

function trades(;params...)
  return Clarus.api_request("Portfolio","Trades";params...)
end

end #MODULE-END
