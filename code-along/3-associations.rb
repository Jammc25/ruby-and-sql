# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner code-along/3-associations.rb

# **************************
# DON'T CHANGE OR MOVE
Contact.destroy_all
# **************************

puts "There are #{Company.all.count} companies"
puts "There are #{Contact.all.count} contacts"

# - Insert and read contact data for companies in the database
apple = Company.find_by({"name" => "Apple"})
p apple


# 1. insert new rows in the contacts table with relationship to a company

contact = Contact.new
#p contact
contact["first_name"] = "Tim"
contact["last_name"] = "Cook"
contact["email"] = "Tim.Cook@apple.com"
contact["company_id"] = apple["id"]
contact.save
#p contact

contact = Contact.new
#p contact
contact["first_name"] = "Craig"
contact["last_name"] = "Federighi"
contact["email"] = "Craig@apple.com"
contact["company_id"] = apple["id"]
contact.save
#p contact

amazon = Company.find_by({"name" => "Amazon"})

contact = Contact.new
#p contact
contact["first_name"] = "Jeff"
contact["last_name"] = "Bezos"
contact["email"] = "Jeff@amazon.com"
contact["company_id"] = amazon["id"]
contact.save
#p contact

puts "There are #{Contact.all.count} contacts"

# 2. How many contacts work at Apple?

apple_employees = Contact.where({"company_id" => apple["id"]})
puts "Apple employees: #{apple_employees.count}"

# 3. What is the full name of each contact who works at Apple?

for contact in apple_employees
    first_name = contact["first_name"]
    last_name = contact["last_name"]
    puts "#{first_name} #{last_name}"
end

