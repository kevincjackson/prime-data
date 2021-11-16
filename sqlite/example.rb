require 'sqlite3'
# https://www.rubydoc.info/gems/sqlite3/1.4.2/SQLite3/Database

# Open a database
db = SQLite3::Database.new "smallprimes.db"

# Wrap in a transaction for speed
db.transaction
# db.execute "DELETE FROM PRIMES;" # Careful!
# db.execute "INSERT INTO primes (number, pos) VALUES (2, 1), (3, 2), (5, 3), (7, 4);"
db.commit

# By default, results are arrays
db.results_as_hash = true

res = []
# Select rows
db.execute("SELECT * FROM primes") do |row|
   res.append row
end

# Get one row only
row1 = db.get_first_row("SELECT * FROM primes WHERE number = ?", 2)
# p row1

# Get scalar
first_prime = db.get_first_value("SELECT number FROM primes where pos = 1;")
puts first_prime

# Close
db.close
