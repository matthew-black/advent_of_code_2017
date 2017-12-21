puzzle = File.readlines("captcha_string.txt").first

def solve_that_captcha(puzzle)
  summable_numbers(puzzle).reduce(:+)
end

def summable_numbers(puzzle)
  summables = [0]
  puzzle.chars.each_with_index do |num, i|
    if matches_previous_digit?(num, i, puzzle)
      summables << num.to_i
    end
  end
  summables
end

def matches_previous_digit?(num, i, puzzle)
  if num == puzzle[i - 1]
    true
  else
    false
  end
end

puts solve_that_captcha(puzzle)