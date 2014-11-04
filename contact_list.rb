require_relative 'contact'
require_relative 'contact_database'

# contact-list: this is the driver class
# create the user interface all puts and gers should be here
# NO puts or gets

contact = Contact.all

case command
when 'list'
  contacts.each do |contact|
    puts contacts.to_s
  end
end