matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]
# # [
# # [a[1][0], a[0][0]]
# # [a[1][1], a[0][1]]
# # [a[1][2], a[0][2]]
# # [a[1][3], a[0][3]]
# # ]

def rotate90(arr)
  (0...arr[0].size).map do |col|
    (arr.size-1).downto(0).map do |row|
      arr[row][col]
    end
  end
end


p rotate90(matrix1)
p rotate90(matrix2)
p new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

# # p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
# # p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
# # p new_matrix3 == matrix2