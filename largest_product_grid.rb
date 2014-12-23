require 'pry'
# largest product of four adjacent numbers in 20 x 20 grid, the grid being an array of arrays

# example of a 4 x 4 grid:
# [
#   [26, 38, 40, 67],
#   [95, 63, 94, 39],
#   [97, 17, 78, 78],
#   [20, 45, 35, 14]
# ]

def largest_product_4_by_4(grid)
  d1 = [grid[0][0], grid[1][1], grid[2][2], grid[3][3]]
  d2 = [grid[0][3], grid[1][2], grid[2][1], grid[3][0]]

  h1 = grid[0]
  h2 = grid[1]
  h3 = grid[2]
  h4 = grid[3]

  v1 = [grid[0][0], grid[1][0], grid[2][0], grid[3][0]]
  v2 = [grid[0][1], grid[1][1], grid[2][1], grid[3][1]]
  v3 = [grid[0][2], grid[1][2], grid[2][2], grid[3][2]]
  v4 = [grid[0][3], grid[1][3], grid[2][3], grid[3][3]]

  combos = [d1, d2, h1, h2, h3, h4, v1, v2, v3, v4]

  greatest_product = 0

  combos.each do |combo|
    product = combo.inject(:*)
    greatest_product = product if product > greatest_product
  end

  greatest_product
end

grid = [
  [26, 38, 40, 67],
  [95, 63, 94, 39],
  [97, 17, 78, 78],
  [20, 45, 35, 14]
]
puts largest_product_4_by_4(grid)