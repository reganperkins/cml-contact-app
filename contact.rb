require 'csv'
# require_relative 'contacts.csv'

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
    @duplicate = false
  end
 
  def to_s(first_name, last_name, email, phone)
    puts "#{first_name} #{last_name} Email: #{email} Phone: #{phone}"
  end

 ## Class Methods
 ## will need to self these

  def help
     puts "Here is a list of available commands:\n \tnew  - Create a new contact\n \tlist - List all contacts\n \tshow - Show a contact\n \tfind - Find a contact"
  end

  def create_contact # (first_name, last_name, email, phone)
    #   # TODO: Will initialize a contact as well as add it to the list of contacts
    #   # if input == 'new'
    #   # prompt email
    #   # prompt full name 
    #   # add to contact_array[] (in a hash?) as strings
    #   # then store contact in CSV file
    #   # return new contact id
    #   # ^ prevent duplicate entries ie if emails are the same
    #   # puts 'this contact already exists'

    #   # Note: This does not mean that you need to 
    #   # store an ID in the file. How can you represent 
    #   # each row in the CSV as an ID?

    puts "What is your email?"
    @email = STDIN.gets.chomp

    CSV.foreach('contacts.csv') do |row| 
      puts " in method!"
      if row == @email 
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

    file = 'contacts.csv'
    @id = file.readlines.size + 1

    CSV.open("contacts.csv", "a") do |contacts_list| 
      contacts_list << "#{@id}, #{first_name}, #{last_name}, #{email}, #{phone}"
    end
    puts "Thanks! Your id number is #{id}"
  end

  #could use a struct???
  # contacts = CSV.foreach('contacts.csv') do |row|
  #   if row[3] == @email
  #     puts "That user already exists"
  #   end
  # end

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
