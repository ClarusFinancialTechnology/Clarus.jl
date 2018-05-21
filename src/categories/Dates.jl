module Dates

import ..Clarus

function fixingdates(;params...)
  return Clarus.api_request("Dates","FixingDates";params...)
end

function fxforwarddate(;params...)
  return Clarus.api_request("Dates","FXForwardDate";params...)
end

function fxoptiondate(;params...)
  return Clarus.api_request("Dates","FXOptionDate";params...)
end

function irdspotdate(;params...)
  return Clarus.api_request("Dates","IRDSpotDate";params...)
end

function maintenanceperiods(;params...)
  return Clarus.api_request("Dates","MaintenancePeriods";params...)
end

function schedule(;params...)
  return Clarus.api_request("Dates","Schedule";params...)
end

end #MODULE-END
