require_relative 'contact'
require_relative 'contact_database'

class Application
  def self.new_contact

    puts "What is your email?"
    email = STDIN.gets.chomp
    duplicate = Contact.duplicate_user(email)
    if duplicate
      puts "That email email already exists. Add another?"
      self.new_contact
    else
      puts "What is your first name?"
      first_name = STDIN.gets.chomp
      puts "What is your last name?"
      last_name = STDIN.gets.chomp
      id = Contact.create(first_name, last_name, email) #@phone
      puts "Thanks! Your id number is #{id}"
    end
  end

  def self.display_options
    puts "Here is a list of available commands:\n \tnew  - Create a new contact\n \tlist - List all contacts\n \tshow - Show a contact\n \tfind - Find a contact"
  end

  def self.list_contacts
    contacts = Contact.all
    contacts.each do |row|
      puts row.to_s
    end
  end

  def self.show_by_id
    puts "Please enter the id of the contact you are looking for"
    id = STDIN.gets.chomp

    found_user = Contact.show(id)
    puts "Here you are! " + found_user
  end

  def self.find_by_term
    puts "Please enter the name or email of the contact you are looking for"
    search_term = STDIN.gets.chomp

    user = Contact.find(search_term)
    puts "here you are! " + user
  end
end
