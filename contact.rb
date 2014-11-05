require 'csv'
require_relative 'contact_database'

class Contact

  class DuplicateUser < StandardError
  end
 
  attr_accessor :first_name, :last_name, :email 
 
  #are all instance variables suppose to be declared here? what if I only use them once? 

  def initialize(first_name, last_name, email, phone)
    @first_name = first_name
    @last_name =last_name
    @email = email
  end
 
  #how would I use this? 
  # variable.to_s(arrray)
  # what about outside of the class? 
  # variable.Contact.to_s(array) ???

  # should anything here be a @@class_variable? 
  def to_s
    "<#first_name}> <#last_name> (<#{email}>)"
  end

 ## Class Methods

  def self.create(first_name, last_name, email)
    duplicate = Database.duplicate_user(email) 

    #loop
      begin
        raise DuplicateUser if duplicate
      rescue DuplicateUser
        puts 'That user already exists, please enter a new email'

        # throw away info and start again
      end
      Database.add_to_csv(first_name, last_name, email)
  end


  def self.find(search_term)
  user = Database.query_users(search_term)
  end

  def self.all
    contacts_list = Database.list_contacts
  end


  def self.show(id)
    found_user = Database.find_by_id(id)
  end
 
end
