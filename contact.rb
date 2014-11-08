require 'csv'
require_relative 'contact_database'

class Contact

  class DuplicateUser < StandardError
  end
 
  attr_accessor :first_name, :last_name, :email 

  def initialize(first_name, last_name, email, phone)
    @first_name = first_name
    @last_name =last_name
    @email = email
  end
 
  def to_s
    "<#first_name}> <#last_name> (<#{email}>)"
  end

 ## Class Methods

  def self.create(first_name, last_name, email)
      ContactDatabase.csv_write(first_name, last_name, email)
  end

  def self.duplicate_user(email)
    if ContactDatabase.csv_read.flatten.include?(email)
      true
    else
      false
    end
  end

  def self.find(search_term)

    user = "I could not find a contact containing #{search_term}"
    contact_row = ContactDatabase.csv_read
    contact_row.each do |row|
      row.each do |cell|
        if cell.include?(search_term)
          user = "<#{row[1]}> <#{row[2]}> (#{row[3]})"
        end
      end
    end
    user

  end

  def self.all
    contacts_list = ContactDatabase.list_contacts
  end


  def self.show(id)
    found_contact = "I could not find a contact with an id of #{id}"
    contact_row = ContactDatabase.csv_read
    contact_row.each do |row|
      if row[0] == id
        found_contact = "<#{row[1]}> <#{row[2]}> (#{row[3]})"
      end
    end
    found_contact
  end
 
end
