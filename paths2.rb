def findSubPath (path, subpath)
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

  mostcommon = ''
  mostOccurences = 0
  candidates = {}

  paths.each_with_index { |path, z|
    puts "#{z}/#{paths.length}"

    for ndx in (0...path.length-3)
      subpath = path.slice(ndx, 4)

      if !candidates[subpath]
        candidates[subpath] = 0

        paths.each { |path2|
          found = false

          if findSubPath(path2, subpath) && found == false
            candidates[subpath] = candidates[subpath] + 1
            found = true
          end
        }

        if (candidates[subpath] > mostOccurences)
          mostOccurences = candidates[subpath]
          mostcommon = subpath
        end
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
