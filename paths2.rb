def findSubPath (path, subpath)
  # puts "findSubPath: (#{path}, #{subpath})"

  # subpath.each{ |spc|
  #
  # }
  # p = path.to_s
  # sp = subpath.to_s

  # if p.include? sp
  #   # puts "TRUE"
  #   return true
  # else
  #   # puts "FALSE"
  #   return false
  # end

  for ndx in (0...path.length-3)
    subsubpath = path.slice(ndx, 4)
    if subsubpath == subpath
      return true
    end
  end

  return false

end

def mostCommon4PagePath (paths)

  # we can throw away any paths of length less than 4
  paths = paths.select {|path| path.length >=4}

  # puts paths.inspect

  mostcommon = ''
  mostOccurences = 0
  candidates = {}

  paths.each_with_index { |path, z|
    # puts "#{z}/#{paths.length}"
    # puts path.inspect
    # puts occurences

    for ndx in (0...path.length-3)
      # puts ndx
      subpath = path.slice(ndx, 4)
      # puts "subpath: #{subpath.inspect}"


      if !candidates[subpath]
        # occurences = 0
        candidates[subpath] = 0

        paths.each { |path2|
          found = false

          if findSubPath(path2, subpath) && found == false
            # puts "subpath found"
            # puts path2.inspect
            # puts subpath.inspect
            candidates[subpath] = candidates[subpath] + 1
            found = true
          else
            # puts "subpath NOT found"
          end
        }

        if (candidates[subpath] > mostOccurences)
          mostOccurences = candidates[subpath]
          mostcommon = subpath
        end
        # occurences = occurences2
        # mostcommon = subpath

      else
        # puts "#{subpath} already was checked"
      end


    end
  }

  puts "Most common 4 page path: p#{mostcommon.join(',p')}"
  puts "Number of occurences: #{candidates[mostcommon].to_i()}"
end

def cleanInput (paths)
  paths.map { |s0|
    s0.split(',').map{ | s1 | s1.gsub('p', '').gsub("\n", '')}
  }
end

paths = File.readlines('paths2.txt')
puts mostCommon4PagePath(cleanInput(paths))
