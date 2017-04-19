
  numbers = "4 5 29 54 4 0 -214 542 -64 1 -3 6 -6"
  p numbers.split.mapsort
  puts [numbers.split.sort.last, numbers.split.sort.first].to_s
