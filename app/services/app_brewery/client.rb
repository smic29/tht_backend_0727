require 'net/http'

class AppBrewery::Client
  def initialize
    @config = AppBrewery::Configuration.new
  end

  def get(num, format)
    response_array = []
    num.times do
      response = http_request
      response_array << response
    end

    AppBrewery::Response.new(response_array, format)
  end

  private

  def http_request(uri = @config.base_url)
    uri = URI(uri)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.read_timeout = 10

    request = Net::HTTP::Get.new(uri)

    http.request(request)
  end
end
