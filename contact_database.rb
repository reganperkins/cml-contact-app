## TODO: Implement CSV reading/writing
require 'csv'

#no puts
# arrays and contact data asks for info from this class



# # out puts data per row as array
# contacts = CSV.foreach('contacts.csv') do |row|
#   puts row.inspect
# end

class Database

  def self.list_contacts
    all_contacts = []
    contacts = CSV.foreach('contacts.csv') do |row|
      all_contacts << row
    end
    all_contacts # .flatten
   #CSV.foreach('contacts.csv') do |row|
      # puts "#{row[1]} #{row[2]} #{row[3]} #{row[4]}"
    #end
      # exit app how????
  end

  def self.add_to_csv(first_name, last_name, email)
    id = File.foreach('contacts.csv').count + 1
    CSV.open("contacts.csv", "a") do |contacts_list| 
      contacts_list << [id, first_name, last_name, email]
    end
    id
  end

  def self.duplicate_user(email)
    is_true = false
    CSV.foreach('contacts.csv') do |contact| 
      if contact[3] == email 
        is_true = true
      end
    end
    is_true
  end

  def self.find_by_id(id)
    found_contact = "I could not find a contact with an id of #{id}"
    CSV.foreach('contacts.csv') do |row|
      if row[0] == id
        found_contact = "#{row[1]} #{row[2]} #{row[3]}"
      end
    end
    found_contact
  end

  def self.query_users(search_term)
    user = "I could not find a contact containing #{search_term}"
    CSV.foreach('contacts.csv') do |row|
      row.each do |contact| 
        if contact.include?(search_term) 
          user = "#{row[1]} #{row[2]} #{row[3]}"
        end
      end
    end
    user 
  end

end


# # exception errors
#   duplicate_user_error = CSV.foreach('contacts.csv') do |row| 
#       #puts " in method!"
#       # if statment not working
#       if row[3] == @email 
#         @duplicate = true
#         # puts "its true!"
#       end
#     end
