# Write a method that displays an 8-pointed star in an nxn grid, where n is an odd integer that is supplied as an argument to the method. The smallest such star you need to handle is a 7x7 grid.


def star(grid_size)
  mid = grid_size / 2
  pattern_arr = (1..mid + 1).to_a + 
                (1..mid).to_a.reverse
  # => [1, 2, 3, ..., 3, 2, 1]

  final_plots =                
    pattern_arr.map do |num|
      [num, mid + 1, grid_size + 1 - num]
    end
p final_plots
  final_plots[mid] = (1..grid_size).to_a
  
  final_plots.map do |sub_arr|
    (1..grid_size).each do |plot|
      sub_arr.include?(plot) ? (print '*') : (print ' ')
    end
    print "\n" 
  end
end


star(7)
# [1,4,7]
# [2,4,6]
# [3,4,5]
# [1..7]
# [3,4,5]
# [2,4,6]
# [1,4,7]
# ...


# *  *  *
#  * * *
#   ***
# *******
#   ***
#  * * *
# *  *  *
star(11)

# *   *   *
#  *  *  *
#   * * *
#    ***
# *********
#    ***
#   * * *
#  *  *  *
# *   *   *