require_relative 'contact'
require_relative 'contact_database'

# contact-list: this is the driver class
# create the user interface all puts and gers should be here
# NO puts or gets elsewhere

def new_contact
  puts "What is your email?"
  email = STDIN.gets.chomp
  # add exception here? or in contacts? 
  puts "What is your first name?"
  first_name = STDIN.gets.chomp
  puts "What is your last name?"
  last_name = STDIN.gets.chomp
  id = Contact.create(first_name, last_name, email) #@phone
  puts "Thanks! Your id number is #{id}"
end

def display_options
  puts "Here is a list of available commands:\n \tnew  - Create a new contact\n \tlist - List all contacts\n \tshow - Show a contact\n \tfind - Find a contact"
end








command = ARGV[0]



case command
when 'help'
  display_options

# still need to output in right formatt
when 'list' # list - all contacts
  contacts = Contact.all
  contacts.each do |row|
    puts row.to_s
  end

when 'new' # Create a new contact
  new_contact

when 'show' # show - Show a contact
  puts "Please enter the id of the contact you are looking for"
  id = STDIN.gets.chomp

  found_user = Contact.show(id)
  puts "here you are! " + found_user

when 'find' # find - Find a contact
  puts "Please enter the name or email of the contact you are looking for"
  search_term = STDIN.gets.chomp

  user = Contact.find(search_term)
  puts "here you are! " + user
end
