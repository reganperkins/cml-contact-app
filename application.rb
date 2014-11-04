class Application

  def help
    if user_input == 'help' || 'Help'
      puts "Here is a list of available commands: \n
      \t new  - Create a new contact \n
      \t list - List all contacts \n
      \t show - Show a contact \n
      \t find - Find a contact" 
    end
  end

end