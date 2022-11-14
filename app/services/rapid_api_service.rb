require 'uri'
require 'net/http'
require 'openssl'
require 'json'

class RapidApiService
  URL = URI('https://text-analysis12.p.rapidapi.com/sentiment-analysis/api/v1.1')

  def initialize(comments)
    @comments = comments
  end

  def sentiment_request
    rapid_api_configuration
    request = Net::HTTP::Post.new(url)
    request["content-type"] = 'application/json'
    request["X-RapidAPI-Key"] = 'dd4dd5d1e3msh12fe9a9c9343181p1052cejsn4d9543962314'
    request["X-RapidAPI-Host"] = 'text-analysis12.p.rapidapi.com'
    request.body = {
      data: {
        language: 'english',
        text: @comments
      }
    }.to_json
    response = http.request(request)
    response
  end

  private

  def rapid_api_configuration
    url = URI('https://text-analysis12.p.rapidapi.com/sentiment-analysis/api/v1.1')
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  end
end