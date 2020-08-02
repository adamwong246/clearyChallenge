def mostCommonPagePaths (paths, maxResults, pathLength)

  # we can throw away any paths of length less than 4
  paths = paths.select {|path| path.length >=pathLength}

  candidates = {}

  paths.each_with_index { |path, z|
    for ndx in (0...path.length - (pathLength-1))
      subpath = path.slice(ndx, pathLength)
      if candidates[subpath].nil?
        candidates[subpath] = 1
      else
        candidates[subpath] = candidates[subpath] + 1
      end
    end
  }

  ranks = []

  candidates = candidates.each{ |candidatePath, candidateScore|
    if ranks[candidateScore].nil?
      ranks[candidateScore] = [candidatePath]
    else
      ranks[candidateScore] = ranks[candidateScore].push(candidatePath)
    end
  }

  puts "RANK\tPATHS"

  ranks.compact.reverse[0...maxResults]
  .each_with_index{|paths, ndx|
    prettyPaths = paths.map{|path| 'p' + path.join(",p")}.join(", ")
    puts "#{ndx}\t#{prettyPaths}"
  }

end

def mostCommonPaths(file, maxResults, pathLength)
  paths = File.readlines(file)
  mostCommonPagePaths(paths.map { |s0|
    s0.split(',').map{ | s1 | s1.gsub('p', '').gsub("\n", '')}
  }, maxResults, pathLength)
end

# start
mostCommonPaths(ARGV[0], ARGV[1].to_i, ARGV[2].to_i)
