class AppBrewery::Configuration
  attr_reader :base_url

  def initialize
    @base_url = 'https://bored-api.appbrewery.com/random'
  end
end
