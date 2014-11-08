## TODO: Implement CSV reading/writing
require 'csv'

class ContactDatabase

  def self.csv_read
    readlines = []
    CSV.foreach('contacts.csv') do |row|
      readlines << row
    end
    readlines
  end

  def self.csv_write(first_name, last_name, email)
    id = File.foreach('contacts.csv').count + 1
    CSV.open("contacts.csv", "a") do |file| 
      file << [id, first_name, last_name, email]
    end
    id
  end

end