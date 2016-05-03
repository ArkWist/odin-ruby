require "csv"
require "sunlight/congress"
require "erb"

Sunlight::Congress.api_key = "40cbccbbcc0f4ad0a8ce822a997a71e5"

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5, "0")[0..4]
end

def legislators_by_zpcode(zipcode)
  Sunlight::Congress::Legislator.by_zipcode(zipcode)
end

def save_thank_you_letters(id, form_letter)
  Dir.mkdir("output") unless Dir.exists? "output"

  filename = "output/thanks_#{id}.html"

  File.open(filename, "w") do |file|
    file.puts form_letter
  end
end

def clean_number(number)
  number = number.to_s.delete(/\D/).join(//)
  if number.length == 11
    number = number.delete(/^1/)
  end
  if number.length != 10
    number = 0
  else
    number = number.to_i
  end
end

puts "EventManager initialized."

contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol

template_letter = File.read "form_letter.erb"
letter_template = ERB.new template_letter

template_numbers = File.read "form_numbers.erb"
number_template = ERB.new template_numbers

contents.each do |row|
  id = row[0]
  name = row[:first_name]

  zipcode = clean_zipcode(row[:zipcode])

  form_letter = letter_template.result(binding)

  save_thank_you_letters(id, form_letter)
end

contents.each do |row|
  id = row[0]
  name = row[:first_name]
  
  phone = clean_phone(row[:homephone])
  
  # form_numbers = number_template.result(binding)
  
  # save_phone_numbers(id, form_numbers)
  
  ### How do we make this one file created outside the loop?
end
