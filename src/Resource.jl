module Resource
using ..Clarus
import CSV
export read,write

function openFile(filename, mode = "r")
  if isfile(filename)
    return open(filename,mode)
  end
  if isdir(Clarus.Services.credentials.resource_path)
    filename = joinpath(Clarus.Services.credentials.resource_path,filename)
  end
  return open(filename,mode)
end

function read(filenames)
  Clarus.Services.__init_credentials!__(Clarus.Services.credentials_init);
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
  end
  f = openFile(filename;mode="w")
  Base.write(f,r.httpresponse.data)
  close(f)
  return
end



end #MODULE-END
