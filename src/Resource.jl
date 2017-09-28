module Resource
#=NOTE: Functions are added to mimic Clarus.py library.
            Further functionality to be added in the future.=#

export read

function openFile(filename; mode = "r")
  if isfile(filename)
    return open(filename,mode)
  end
  return
end

function read(filenames)
  return readfiles(filenames)
end

function readfiles(filenames)
  streams = String[]
  for filename in split(filenames,",")
      f = openFile(strip(filename))
      if f != nothing
        push!(streams,readstring(f))
        close(f)
      end
  end
  return streams
end


end #MODULE-END
