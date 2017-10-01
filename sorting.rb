#!/usr/bin/ruby

def create_arr(str)
	arr = str.split(" ").map { |s| s.to_i }
	arr[0..@arr_size.to_i-1]
end

def swap_values(arr, idx1, idx2)
	temp = arr[idx1]
	arr[idx1] = arr[idx2]
	arr[idx2] = temp
	arr
end

def swap_method(arr)
	last_arr_idx = @arr_size - 1
	first_idx, last_idx = 0

	# get last index that not in a correct position
	@arr_size.times do
		unless arr[last_arr_idx] > arr[last_arr_idx - 1]
			last_idx = last_arr_idx 
			break
		end
		last_arr_idx -= 1
	end

	# get first index that not in a correct position
	@arr_size.times do |idx|
		unless arr[idx] < arr[idx + 1]
			first_idx = idx 
			break
		end
		last_arr_idx += 1
	end

	arr = swap_values(arr, first_idx, last_idx)
	
	if is_sorted?(arr)
		{
			status: 'ok',
			message: "yes\nswap #{first_idx+1} #{last_idx+1}"
		}
	else
		{
			status: 'error'
		}
	end
end

def reverse_method(arr)
	last_arr_idx = @arr_size - 1
	first_idx, last_idx = 0

	@arr_size.times do
		unless arr[last_arr_idx] > arr[last_arr_idx - 1]
			last_idx = last_arr_idx
			break
		end
		last_arr_idx -= 1
	end	

	loop_times = last_idx
	loop_times.times do
		unless arr[loop_times] < arr[loop_times - 1]
			first_idx = loop_times
			break
		end
		loop_times -= 1
	end	

	arr_to_reverse = arr[first_idx..last_idx]
	arr = remove_arr_to_reverse(arr, arr_to_reverse)
	arr_to_reverse.reverse!
	arr = arr.insert(first_idx, *arr_to_reverse)
	
	if is_sorted?(arr)
		{
			status: 'ok',
			message: "yes\nreverse #{first_idx+1} #{last_idx+1}"
		}
	else
		{
			status: 'error'
		}
	end
end

def remove_arr_to_reverse(actual_arr, arr_to_reverse)
	actual_arr.reject! {|val| arr_to_reverse.include? val }
end

def is_sorted?(arr)
	arr.sort == arr
end

print "Enter the size of your array: "
STDOUT.flush
@arr_size = gets.chomp.to_i
print "Enter your array (please ensure you add ' '/space between the values): "
STDOUT.flush
str = gets.chomp

if is_sorted?(create_arr(str))
	print "yes\n"
else
	reverse_method = reverse_method(create_arr(str))
	swap_method = swap_method(create_arr(str))

	if swap_method[:status] == 'ok'
		print "#{swap_method[:message]}\n"
	else
		if reverse_method[:status] == 'ok'
			print "#{reverse_method[:message]}\n"
		else
			print "no\n"
		end
	end
end





