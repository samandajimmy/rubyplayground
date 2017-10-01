#!/usr/bin/ruby

def rotate_rings(arr, rotate_times)
  matrix = arr.transpose.transpose
  rotate_times.times { rotate_rings_once(matrix) }
  matrix
end

def rotate_rings_once(arr)
  ring_counter = (arr.size/2)
  matrix = arr.transpose.transpose
  4.times do
    ring_counter.times { |i| arr[i][i..-i-1] = matrix[i][i+1..-i-1] << matrix[i+1][-i-1] }
    rotate_array!(arr)
    rotate_array!(matrix)
  end
end

def rotate_array!(arr)
  arr.replace(arr.map!(&:reverse).transpose)
end

def create_arr(str)
  arr = str.split(" ").map { |s| s.to_i }
end

array = []
print "REMEMBER!! please add space in every values you will input\n"
print "Enter your array format: "
STDOUT.flush
array_format = gets.chomp
line_counter = create_arr(array_format)[0]
rows_counter = create_arr(array_format)[1]
rotation_counter = create_arr(array_format)[2]

print "REMEMBER!! please input #{rows_counter} row(s) of array\n"
line_counter.times do |idx|
  print "enter your array for line number #{idx+1}: "
  STDOUT.flush
  array.push(create_arr(gets.chomp))
end

array_rotated = rotate_rings(array, rotation_counter)
array_rotated.each do |array_value|
  print "#{array_value.join(' ')}\n"
end
