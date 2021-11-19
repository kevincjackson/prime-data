require 'redis'

DATAFILE = "primes_0B.bin"
bin = File.read(DATAFILE)
str = bin.unpack("B*").first
bitDecoder = { 0 => 1, 1 => 3, 2 => 7, 3 => 9}
byteDecode = ->(b) { (b / 4) * 10} 
c1379To10 = ->(n) { byteDecode.(n) + bitDecoder[n % 4] }

# Create instance.
r = Redis.new

# Loop through data
puts "Writing..."
600_000_000.upto(str.size - 1) do |i|
    puts("#{i} ") if i % 100 == 0
    r.setbit(:primes, c1379To10.(i), str[i])
end

# Persist
puts "\nSaving."
r.save
puts "Done"
