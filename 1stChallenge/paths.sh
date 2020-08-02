echo "The given example: the most common 4-page path from the sample data"
ruby paths.rb paths1.txt 1 4

echo "The main question: the most common 4 page path"
ruby paths.rb paths2.txt 1 4

echo "bonus 1.a: the most common 5 page path"
ruby paths.rb paths2.txt 1 5

echo "bonus 1.b: the most common 7 page path"
ruby paths.rb paths2.txt 1 7

echo "bonus 2: the top 5 most common 4 page paths"
ruby paths.rb paths2.txt 5 4
