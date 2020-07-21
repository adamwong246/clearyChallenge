def mostCommon4PagePath (paths)
  puts paths.inspect
end

def cleanInput (paths)
  paths.map { |s0|
    s0.split(',').map{ | s1 | s1.gsub('p', '').gsub("\n", '')}
  }
end

paths = File.readlines('paths2.txt')
mostCommon4PagePath(cleanInput(paths))
