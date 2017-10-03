module Resource
using ..Clarus
import CSV
export read,write

function openFile(filename; mode = "r")
  if length(filename) !=0
    if isfile(filename)
      return open(filename,mode)
    end
  end
  if isdir(Clarus.Services.credentials.resource_path)
    filename = joinpath(Clarus.Services.credentials.resource_path,filename)
    if isfile(filename)
      return open(filename,mode)
    end
  end
  return
end

function read(filenames)
  return readfiles(filenames)
end

function readfiles(filenames)
  strings = String[]
  for filename in split(filenames,","; keep = false)
      f = openFile(strip(filename))
      if f != nothing
        push!(strings,readstring(f))
        close(f)
      end
  end
  return strings
end

function write(filename,r::Clarus.Services.Response)
  if length(dirname(filename)) == 0
  filename = joinpath(Clarus.Services.credentials.savefile_path,filename)
  else
    if !isdir(dirname(filename))
      mkpath(dirname(filename))
    end
    Clarus.Services.credentials.savefile_path = dirname(filename)
  end
  df = Clarus.dataframe!(r)
  CSV.write(filename,df)
end



end #MODULE-END
