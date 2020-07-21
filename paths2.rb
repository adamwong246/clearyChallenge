require 'set'

def findSubPath (path, subpath)
  puts "findSubPath: (#{path}, #{subpath})"

  p = path.join('')
  sp = subpath.join('')

  if p.include? sp
    puts "TRUE"
    return true
  else
    puts "FALSE"
    return false
  end

end

def mostCommon4PagePath (paths)

  # we can throw away any paths of length less than 4
  paths = paths.select {|path| path.length >=4}

  # puts paths.inspect

  mostcommon = []
  occurences = 0

  paths.each { |path|
    puts ""
    puts path.inspect
    puts occurences

    for ndx in (0...path.length-3)
      # puts ndx
      subpath = path.slice(ndx, 4)
      puts "subpath: #{subpath.inspect}"


      occurences2 = 0
      paths.each { |path2|

        if findSubPath(path2, subpath)
          # puts "subpath found"
          # puts path2.inspect
          # puts subpath.inspect
          occurences2 = occurences2 + 1
        else
          # puts "subpath NOT found"
        end


      }

      if (occurences2 > occurences)
        occurences = occurences2
        mostcommon = subpath
      end


    end
  }

  puts "Most common 4 page path: p#{mostcommon.join(',p')}"
  puts "Number of occurences: #{occurences.to_i()}"
end

def cleanInput (paths)
  paths.map { |s0|
    s0.split(',').map{ | s1 | s1.gsub('p', '').gsub("\n", '')}
  }
end

paths = File.readlines('paths2.txt')
puts mostCommon4PagePath(cleanInput(paths))
