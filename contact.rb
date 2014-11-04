require 'csv'
# require_relative 'contacts.csv'
#deals with the contact data base directly

class Contact

  class DuplicateUser < StandardError
  end
 
  attr_accessor :first_name, :last_name, :email, :phone, :duplicate
 
  def initialize#(first_name, last_name, email, phone)
    # TODO: assign local variables to instance variables
    @first_name = first_name
    @last_name =last_name
    @email = email
    @phone = phone
    # @duplicate = false
  end
 
  def to_s(first_name, last_name, email, phone)
    # return string 
    puts "#{first_name} #{last_name} Email: #{email} Phone: #{phone}"
  end

 ## Class Methods
 ## will need to self these

  def help
     puts "Here is a list of available commands:\n \tnew  - Create a new contact\n \tlist - List all contacts\n \tshow - Show a contact\n \tfind - Find a contact"
  end

  def create_contact # (first_name, last_name, email, phone)

    puts "What is your email?"
    @email = STDIN.gets.chomp

    CSV.foreach('contacts.csv') do |row| 
      puts " in method!"
      # if statment not working
      if row[3] == @email 
        @duplicate = true
        puts "its true!"
      end
    end

      begin
        raise DuplicateUser if @duplicate
      rescue DuplicateUser
        puts "That user already exists"
      end

    puts "What is your first name?"
    first_name = STDIN.gets.chomp
    puts "What is your last name?"
    last_name = STDIN.gets.chomp

    id = File.foreach('contacts.csv').count + 1

    CSV.open("contacts.csv", "a") do |contacts_list| 
      contacts_list << [id, first_name, last_name, email, phone]
    end

    puts "Thanks! Your id number is #{id}"
  end

  def find(string)
  # TODO: Will find and return contact by index
    CSV.foreach('contacts.csv') do |row|
      row.each do |contact| 
        if contact.include?(string) 
        #if row.include?(string)
          puts "#{row[1]} #{row[2]} #{row[3]} #{row[4]}"
      end
      end
    end
  end

  def list
    # return the list of contacts, as is 
    #Reach out to ContactDatabase and ask for 
    # an Array of contacts

    CSV.foreach('contacts.csv') do |row|
      puts "#{row[1]} #{row[2]} #{row[3]} #{row[4]}"
    end
      # exit app how????
  end

  def show
    puts "Please enter the id of the contact you are looking for"
    id = STDIN.gets.chomp

    CSV.foreach('contacts.csv') do |row|
      if row[0] == id
        puts "#{row[1]} #{row[2]} #{row[3]} #{row[4]}"
      end
    end
  end
 
end

test = Contact.new


# test.help
# test.to_s('Regan', 'Perkins', 'reganlperkins@gmail.com', '604 892 4634')
# test.show
# test.list
# test.find('Regan')
test.create_contact
