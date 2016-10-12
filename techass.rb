require 'net/http'
require 'uri'
require 'json'

uri = URI.parse("http://challenge.code2040.org/api/register")

header = {'Content-Type': 'text/json'}
user = {token: '8fe0646675b3c30b632bdf6decb23f1e', github: ''}            }

# Create the HTTP objects
http = Net::HTTP.new(uri.host, uri.port)
request = Net::HTTP::Post.new(uri.request_uri, header)
request.body = user.to_json

# Send the request
response = http.request(request)