require "socket"

hostname = "localhost"
port = 2000

s = TCPSocket.open(hostname, port)

while line = s.gets
  put line.chop
end
s.close