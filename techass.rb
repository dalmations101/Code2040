require 'net/http'
require 'uri'
require 'json'
require 'time'

=begin
Written By: Thomas Outing
email: touting15@gmail.com

Because of my extensive experience programming with ruby I figured
the challenges wouldn't be too hard. Ruby comes with such a robust library
to use with strings, array, and hashes that functional programming
becomes pretty simple. What I learned most from this whole thing was how
to interact with a REST API in order to send data or 'POST' and receive
response.
=end

uri = URI.parse("http://challenge.code2040.org/api/register")

# Create the HTTP objects
http = Net::HTTP.new(uri.host, uri.port)
request1 = Net::HTTP::Post.new(uri.request_uri, 'Content-Type' => 'application/json')
request1.body = {token: "8fe0646675b3c30b632bdf6decb23f1e", github: "https://github.com/touting15/Code2040"}.to_json

# Send the request
response1 = http.request(request1)
puts response1.body
#STEP 1 COMPLETED------------------------------------------


uri = URI.parse("http://challenge.code2040.org/api/reverse")

# Create the HTTP objects
http = Net::HTTP.new(uri.host, uri.port)
request2 = Net::HTTP::Post.new(uri.request_uri, 'Content-Type' => 'application/json')
request2.body = {token: "8fe0646675b3c30b632bdf6decb23f1e"}.to_json
# Send the request

rev_string = http.request(request2).body

#Calling ruby reverse function from ruby's string library
rev_string.reverse!


uri = URI.parse("http://challenge.code2040.org/api/reverse/validate")

# Create the HTTP objects
http = Net::HTTP.new(uri.host, uri.port)
request2 = Net::HTTP::Post.new(uri.request_uri, 'Content-Type' => 'application/json')
request2.body = {token: "8fe0646675b3c30b632bdf6decb23f1e",string: rev_string}.to_json

#Response from validation of the reversed string
response2 = http.request(request2).body
puts response2

#STEP 2 COMPLETED------------------------------------------

uri = URI.parse("http://challenge.code2040.org/api/haystack")

# Create the HTTP objects
http = Net::HTTP.new(uri.host, uri.port)
request3 = Net::HTTP::Post.new(uri.request_uri, 'Content-Type' => 'application/json')
request3.body = {token: "8fe0646675b3c30b632bdf6decb23f1e"}.to_json
# Send the request


haystack_hash = JSON.parse(http.request(request3).body)

#Calling ruby find_index function from ruby's Array library
index = haystack_hash["haystack"].find_index(haystack_hash["needle"])

uri = URI.parse("http://challenge.code2040.org/api/haystack/validate")

# Create the HTTP objects
http = Net::HTTP.new(uri.host, uri.port)
request3 = Net::HTTP::Post.new(uri.request_uri, 'Content-Type' => 'application/json')
request3.body = {token: "8fe0646675b3c30b632bdf6decb23f1e",needle: index.to_s}.to_json

#Response from validation of the reversed string
response3 = http.request(request3).body
puts response3

#STEP 3 COMPLETED------------------------------------------

uri = URI.parse("http://challenge.code2040.org/api/prefix")

# Create the HTTP objects
http = Net::HTTP.new(uri.host, uri.port)
request4 = Net::HTTP::Post.new(uri.request_uri, 'Content-Type' => 'application/json')
request4.body = {token: "8fe0646675b3c30b632bdf6decb23f1e"}.to_json
# Send the request

prefix_hash = JSON.parse(http.request(request4).body)

#Calling ruby find_index function from ruby's Array library

prefix = prefix_hash["prefix"]
prefix_array = prefix_hash["array"]
prefix_array.delete_if{ |element| element.start_with?(prefix)}

uri = URI.parse("http://challenge.code2040.org/api/prefix/validate")

# Create the HTTP objects
http = Net::HTTP.new(uri.host, uri.port)
request4 = Net::HTTP::Post.new(uri.request_uri, 'Content-Type' => 'application/json')
request4.body = {token: "8fe0646675b3c30b632bdf6decb23f1e",array: prefix_array}.to_json

#Response from validation of the new array with the
#items with the 'prefix' deleted.
response4 = http.request(request4).body
puts response4

#STEP 4 COMPLETED------------------------------------------

uri = URI.parse("http://challenge.code2040.org/api/dating")

# Create the HTTP objects
http = Net::HTTP.new(uri.host, uri.port)
request5 = Net::HTTP::Post.new(uri.request_uri, 'Content-Type' => 'application/json')
request5.body = {token: "8fe0646675b3c30b632bdf6decb23f1e"}.to_json
# Send the request

dating_hash = JSON.parse(http.request(request5).body)
datestamp = Time.parse(dating_hash["datestamp"])
interval = dating_hash["interval"].to_i

datestamp = (datestamp + interval).iso8601


uri = URI.parse("http://challenge.code2040.org/api/dating/validate")

# Create the HTTP objects
http = Net::HTTP.new(uri.host, uri.port)
request5 = Net::HTTP::Post.new(uri.request_uri, 'Content-Type' => 'application/json')
request5.body = {token: "8fe0646675b3c30b632bdf6decb23f1e",datestamp: datestamp.to_s}.to_json

#Response from validation of the new array with the
#items with the 'prefix' deleted.
response5 = http.request(request5).body
puts response5