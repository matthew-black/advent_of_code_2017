sheet = File.open("spreadsheet.txt").map do |line|
  line.split.map { |num| num.to_i }
end

def solve_that_checksum(spreadsheet)
  each_rows_largest_difference(spreadsheet).reduce(:+)
end

def each_rows_largest_difference(spreadsheet)
  spreadsheet.map do |row|
    row.max - row.min
  end
end

puts solve_that_checksum(sheet)
