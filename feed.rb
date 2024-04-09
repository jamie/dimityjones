write = false
STDIN.each_line do |line|
  if line =~ /#####/
    line = line.split("#####").last
    write = true
  end
  print line if write
end
