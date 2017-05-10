# Try modifying your solution or our solution so it prints only the outline of the diamond:

# diamond(5)

#   *
#  * *
# *   *
#  * *
#   *

# def diamond(grid_size)
#   puts "*".center(grid_size)
#   (1..grid_size - 1).step(2) do |space|
#     puts ('*' + ' '*space + '*').center(grid_size)
#   end
#   (grid_size - 3).downto(1) do |space|
#     puts ('*' + ' '*space + '*').center(grid_size) if space.odd?
#   end
#   puts "*".center(grid_size)
# end


def diamond(size)
  [*(1...size), *size.downto(1)].each do |spaces|
    puts ('*' + ' '*spaces + '*').center(size) if spaces.odd?
  end
end

def diamond_hollow(number)
  [*(1...number), *number.downto(1)].each do |spaces|
    str = " " * spaces
    str[0] = str[-1] = "*"
    puts str.center(number) if spaces.odd?
  end
end

diamond(5)
diamond(19)

# 5 => [1,3,5,3,1]

def mirror_sequence(n)
  [*(1...n), *n.downto(1)]
end

p mirror_sequence(5)