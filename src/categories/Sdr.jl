module Sdr

import ..Clarus

function lastprice(;params...)
  return Clarus.api_request("SDR","LastPrice";params...)
end

function lasttrade(;params...)
  return Clarus.api_request("SDR","LastTrade";params...)
end

function tradefilter(;params...)
  return Clarus.api_request("SDR","TradeFilter";params...)
end

function trades(;params...)
  return Clarus.api_request("SDR","Trades";params...)
end

function volume(;params...)
  return Clarus.api_request("SDR","Volume";params...)
end

function volumeadv(;params...)
  return Clarus.api_request("SDR","VolumeADV";params...)
end


end #MODULE-END
