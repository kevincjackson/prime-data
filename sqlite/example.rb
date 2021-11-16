require 'sqlite3'
require 'benchmark'
# https://www.rubydoc.info/gems/sqlite3/1.4.2/SQLite3/Database

puts Benchmark.measure {

   # Open a database
   db = SQLite3::Database.new "smallprimes.db"

   # Wrap in a transaction for speed
   # db.transaction
   # db.execute "DELETE FROM PRIMES;" # Careful!
   # db.execute "INSERT INTO primes (number, pos) VALUES (2, 1), (3, 2), (5, 3), (7, 4);"
   # db.commit

   # By default, results are arrays
   db.results_as_hash = true

   # Select rows
   res = []
   db.execute("SELECT * FROM primes WHERE number < 1000000") { |row| res.append row }
   puts "rows: #{res.size}"

   # Get one row only
   # row1 = db.get_first_row("SELECT * FROM primes WHERE pos = ?", 1000000)
   # row1

   # Get scalar
   # scalar = db.get_first_value("SELECT COUNT(*) FROM primes")
   # puts scalar

   # Close
   db.close

} # Benchmark.measure