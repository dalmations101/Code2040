require 'open-uri'
require 'json'
require 'rubygems'
require 'oauth'

kittens = open('http://challenge.code2040.org/api/register')
pass = 
response_status = kittens.status
puts response status

#response_body = kittens.read[559, 441]

#puts response_status
#puts response_body


access_token = '8fe0646675b3c30b632bdf6decb23f1e'

@consumer = OAuth::Consumer.new(consumer_key, consumer_secret, {:site=>'http://my.site'})
accesstoken = OAuth::AccessToken.new(access_token)
json_response = accesstoken.post(url, params_hash)
# Change the following values to those provided on dev.twitter.com
# The consumer key identifies the application making the request.
# The access token identifies the user making the request.

access_token = OAuth::Token.new(
    "241682167-TrhlFnKnG48GDXe0LoyJtAdRdqolPG5EV6qHeDBV",
    "KeEupfpVHIqI5KzbRcwv9b2OCRprdVZJZR72EhLnZIQuY")

# All requests will be sent to this server.
baseurl = "https://api.twitter.com"

# The verify credentials endpoint returns a 200 status if
# the request is signed correctly.
address = URI("#{baseurl}/1.1/account/verify_credentials.json")

# Set up Net::HTTP to use SSL, which is required by Twitter.
http = Net::HTTP.new address.host, address.port
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_PEER

# Build the request and authorize it with OAuth.
request = Net::HTTP::Get.new address.request_uri
request.oauth! http, consumer_key, access_token

# Issue the request and return the response.
http.start
response = http.request request
puts "The response status was #{response.code}"
