module Dates

import ..Clarus

function fixingdates(;params...)
  return Clarus.api_request("Dates","FixingDates";params...)
end

function fxforwarddate(;params...)
  return Clarus.api_request("Dates","FXForwardDate";params...)
end

function irdspotdate(;params...)
  return Clarus.api_request("Dates","IRDSpotDate";params...)
end

function schedule(;params...)
  return Clarus.api_request("Dates","Schedule";params...)
end

end #MODULE-END
