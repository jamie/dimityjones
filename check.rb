require 'digest'

book = File.read(Dir["Dimity*.txt"].first)

prologue, chapter1_enc = book.split("#####")

`cp Dimity*.txt chapters/chapter_00.txt` if !File.exist?("chapters/chapter_00.txt")

# 01: a2e617919bc0b981a4f9bb8470ed37d189958e4c5b167e58b417a84c29a66c29
book.scan(/(\d+). ([0-9a-f]{64})/).each do |chapter, hash|
  print "Chapter #{chapter}... "
  if File.exist?("chapters/chapter_#{chapter}.txt")
    if hash == Digest::SHA256.hexdigest(File.read("chapters/chapter_#{chapter}.txt"))
      puts "✅"
      next
    end
  end

  if !File.exist?("lib/chapter_#{chapter}.rb")
    File.open("lib/chapter_#{chapter}.rb", "w") do |f|
      f.puts <<~RUBY
        input = STDIN.read

        # `puts` your output, or `print` to preserve newlines in the input.
      RUBY
    end
  end

  prior = format("%02d", chapter.to_i - 1)
  `cat chapters/chapter_#{prior}.txt | ruby feed.rb | ruby lib/chapter_#{chapter}.rb > chapters/chapter_#{chapter}.txt`
  if hash == Digest::SHA256.hexdigest(File.read("chapters/chapter_#{chapter}.txt"))
    puts "✅"
    next
  else
    puts "❌"
    break
  end
end
