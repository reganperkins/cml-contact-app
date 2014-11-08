require_relative 'application'

command = ARGV[0]

case command
when 'help'
  Application.display_options
when 'list' # list - all contacts
  Application.list_contacts
when 'new' # Create a new contact
  Application.new_contact
when 'show' # show - Show a contact
  Application.show_by_id
when 'find' # find - Find a contact
  Application.find_by_term
end
