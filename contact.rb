require 'csv'
require_relative 'contact_database'
# require_relative 'contacts.csv'
#deals with the contact data base directly

class Contact

  class DuplicateUser < StandardError
  end
 
  attr_accessor :first_name, :last_name, :email   # :phone, :duplicate, :id, 
 
  def initialize(first_name, last_name, email, phone)
    # TODO: assign local variables to instance variables
    @first_name = first_name
    @last_name =last_name
    @email = email
    @phone = phone
    @id = id
    @duplicate = false
  end
 
  def to_s(array)
    # return string 
    "#{array[1]} #{array[2]} Email: #{array[3]}"
    # puts "#{first_name} #{last_name} Email: #{email} Phone: #{phone}"
  end

 ## Class Methods

  def self.create(first_name, last_name, email)
    duplicate = Database.duplicate_user(email) 
      begin
        raise DuplicateUser if duplicate
      rescue DuplicateUser
        puts "That user already exists, please enter a new email"
        # throw away info and start again
      end
      Database.add_to_csv(first_name, last_name, email)
  end


  def self.find(search_term)
  # TODO: Will find and return contact by index
  user = Database.query_users(search_term)
  #   CSV.foreach('contacts.csv') do |row|
  #     row.each do |contact| 
  #       if contact.include?(string) 
  #         puts "#{row[1]} #{row[2]} #{row[3]} #{row[4]}"
  #       end
  #     end
  #   end
  end

  def self.all
    contacts_list = Database.list_contacts
    # return the list of contacts, as is 
    #Reach out to ContactDatabase and ask for 
    # an Array of contacts
    # contacts_list = Database.list_contacts
    # contacts_list.each do |row|
    #   puts row.to_s
    # end
  end

# ========
  #   CSV.foreach('contacts.csv') do |row|
  #     puts "#{row[1]} #{row[2]} #{row[3]} #{row[4]}"
  #   end
  #     # exit app how????
  # end

  def self.show(id)
    found_user = Database.find_by_id(id)
    # puts "Please enter the id of the contact you are looking for"
    # id = STDIN.gets.chomp

    # CSV.foreach('contacts.csv') do |row|
    #   if row[0] == id
    #     puts "#{row[1]} #{row[2]} #{row[3]} #{row[4]}"
    #   end
    # end

  end
 
end


# test.help
# test.to_s('Regan', 'Perkins', 'reganlperkins@gmail.com', '604 892 4634')
# test.show

# test.find('Regan')
# test.create_contact
