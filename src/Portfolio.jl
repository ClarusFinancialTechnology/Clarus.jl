module Portfolio

import ..Clarus

function cash(;params...)
  return Clarus.api_request("Portfolios","Cash";params...)
end

function cashbydate(;params...)
  return Clarus.api_request("Portfolios","CashByDate";params...)
end

function fixings(;params...)
  return Clarus.api_request("Portfolios","Fixings";params...)
end

function mtm(;params...)
  return Clarus.api_request("Portfolios","MTM";params...)
end

function notional(;params...)
  return Clarus.api_request("Portfolios","Notional";params...)
end

function summary(;params...)
  return Clarus.api_request("Portfolios","Summary";params...)
end

function trades(;params...)
  return Clarus.api_request("Portfolios","Trades";params...)
end

end #MODULE-END
