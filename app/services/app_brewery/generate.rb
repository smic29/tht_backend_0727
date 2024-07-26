class AppBrewery::Generate
  def initialize
    @client = AppBrewery::Client.new
  end

  def task(num, format)
    response = @client.get(num, format)

    response.data
  end
end
