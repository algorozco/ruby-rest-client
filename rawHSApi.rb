require 'rest-client'
require 'json'
api_key = API_KEY

def listSignatureRequests(api_key, query)
  response = RestClient::Request.new(
     :method => :get,
     :url => 'https://'+api_key+':@api.hellosign.com/v3/signature_request/list?query='+query,
     #:verify_ssl => false
  ).execute
  results = JSON.parse(response.to_str)
  puts results
end

def createEmbeddedWithTemplate(api_key, template_id, client_id)
  response = RestClient::Request.new(
     :method => :post,
     :url => 'https://'+api_key+':@api.hellosign.com/v3/signature_request/create_embedded_with_template',
     payload: { template_id: template_id, client_id: client_id, :signers => [
        {
            :email_address => 'algorozco.ti@gmail.com',
            :name => 'Ana',
            :role => 'Seller'
        }
    ] }
     #:verify_ssl => false
  ).execute
  results = JSON.parse(response.to_str)
  puts results
end

listSignatureRequests(api_key)
#createEmbeddedWithTemplate(api_key)
