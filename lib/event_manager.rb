### Refactoring Clean Zip Codes

require "csv"
require "sunlight/congress"

Sunlight::Congress.api_key = "40cbccbbcc0f4ad0a8ce822a997a71e5"

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5, "0")[0..4]
end

puts "EventManager initialized."

contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol

contents.each do |row|
  name = row[:first_name]

  zipcode = clean_zipcode(row[:zipcode])

  legislators = Sunglight::Congress::Legislator.by_zipcode(zipcode)

  legislator_names = legislators.collect do |legislator|
    "#{legislator.first_name} #{legislator.last_name}"
  end

  legislator_string = legislator_names.join(", ")

  puts "#{name} #{zipcode} #{legislators_string}"
end
