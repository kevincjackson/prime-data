# gem install redis

# This gem maps one to one methods to redis commands!

require 'redis'
require 'benchmark'

# Create instance.
r = Redis.new

# Check connection
r.ping # PONG

# Strings
r.set 'greeting', 'Hello, World!'
r.get 'greeting'
puts r.get(:greeting)

# Bitmaps
r.setbit(:primes, 2, 1)
r.getbit(:primes, 2) # 1
puts r.getbit(:primes, 2)

# puts Benchmark.measure {
#     # transaction
#     r.multi
# 
#     # 34 seconds with or without transaction
#     0.upto(10**6) do |i|
#         r.rpush(:nums, i)
#     end
# 
#     r.exec
# }

p r.lrange(:nums, 10**5, 10**5 + 100)

# Persist
r.save
puts "Saved."
