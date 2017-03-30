#Write a method that counts the number of occurrences of each element in a given array.

#input: an array containing repeating elements
#output: number of occurrences for each element

#vehicles.uniq = ['car', 'truck', 'SUV', 'motorcycle']

vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']

def count_occurrences(arr)
	hash = {}

	arr.uniq.each do |x|
		count = 0
			arr.each do |y|
				if x == y
					count += 1
				end
			end
		hash[x] = count
 	end

 	hash.each do |k,v|
 		puts "#{k} => #{v}"
 	end
end

#LS solution
def count_occ(arr)
	occurrences = {}

	arr.each do |x|
		occurrences[x] = arr.count(x)
	end

	occurrences.each do |vehicle,count|
		puts "#{vehicle} => #{count}"
	end
end

count_occurrences(vehicles)
count_occ(vehicles)
