module Resource
using ..Clarus
export read

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

end #MODULE-END
