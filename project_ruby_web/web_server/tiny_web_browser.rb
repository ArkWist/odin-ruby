require "net/http"
host = "www.tutorialspoint.com"
path = "/index.htm"

http = Net::HTTP.new(host)
headers, body = http.get(path)
if headers.code == "200"
  print body # body is always empty
else
  puts "#{headers.code} #{headers.message}"
end