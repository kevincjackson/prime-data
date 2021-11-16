# Init
BUFFSIZE = 10**6
FILEOUT = "primes_to_1m.csv"

puts "Initializing..."
buf = String.new(capacity: BUFFSIZE)
buf = "0101010101" * (BUFFSIZE / 10) * 4
buf[1] = "0"									# init 1
buf[2] = "1"									# init 2
sqrt = Math.sqrt(BUFFSIZE).to_i 	
puts "size: #{BUFFSIZE}"

## Calc
3.upto(sqrt) do |i| 
	
	# Skip multiples
	if buf[i] == "0"
		next
	end

	if i % 10**4 == 0
		puts "Calculating #{i}...."
	end

	# Leave the current, that's prime
	multiple = i + i

	while multiple < BUFFSIZE 
		# if in range cross it off
		buf[multiple] = "0"
		multiple += i;
	end
end
puts "Calculation complete"

# Output to CSV
puts "Writing to CSV file."
f = File.open(FILEOUT, "w")
count = 0
0.upto(BUFFSIZE) do |i|

	if i % 10**6 == 0
		puts "Writing #{i}...."
	end

	if buf[i] == "1"
		count += 1
		f.puts("#{i},#{count}")
	end
end
f.close
puts "Done."
