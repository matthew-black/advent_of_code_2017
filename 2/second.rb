sheet = File.open("spreadsheet.txt").map do |line|
  line.split.map { |num| num.to_i }
end

def solve_that_checksum(spreadsheet)
  each_rows_division_result(spreadsheet).reduce(:+)
end

def each_rows_division_result(spreadsheet)
  spreadsheet.map do |row|
    divisible_pair = find_divisible_values(row)
    divisible_pair.first / divisible_pair.last
  end
end

def find_divisible_values(row)
  row.each_with_index do |current_num, current_index|
    row.each_with_index do |num, i|
      if current_num % num == 0 && current_index != i
        return [current_num, num]
      end
    end
  end
  # This is just in case they throw in a row with no divisible pair.
  [0 , 1]
end

puts solve_that_checksum(sheet)
