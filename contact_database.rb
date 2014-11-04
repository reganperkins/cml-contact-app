## TODO: Implement CSV reading/writing
require 'csv'

# out puts data per row as array
contacts = CSV.foreach('contacts.csv') do |row|
  puts row.inspect
end

