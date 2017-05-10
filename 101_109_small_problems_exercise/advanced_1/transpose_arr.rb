matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

# new_matrix = [
#     [mtx[0][0], mtx[1][0], mtx[2][0]]
#     [mtx[0][1], mtx[1][1], mtx[2][1]]
#     [mtx[0][2], mtx[1][2], mtx[2][2]]
# ]

def transpose(mtx)
  mtx.map.with_index do |_, idx|
    [mtx[0][idx], mtx[1][idx], mtx[2][idx]]
  end
end

def transpose!(mtx)
  mtx.each_with_index do |sub_arr, row|
    sub_arr.each_with_index do |num, col|
      mtx[row][col], mtx[col][row] = 
      mtx[col][row], mtx[row][col] if
      col < row
    end
  end
  mtx
end


new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
p transpose!(matrix)
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]