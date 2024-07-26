require 'json'
require 'csv'

class AppBrewery::Response
  attr_reader :raw_response

  def initialize(response, format)
    @raw_response = response
    @format = format
  end

  def data
    return parse_json_data(@raw_response) if @format == 'json'
    return parse_csv_data(@raw_response) if @format == 'csv'
  end

  private

  def parse_json_data(data_array)
    data_array.map do |data|
      JSON.parse(data.body)
    end
  end

  def parse_csv_data(data_array)
    data = parse_json_data(data_array)
    puts data.inspect
    CSV.generate(headers: true) do |csv|
      csv << data.first.keys

      data.each do |task|
        csv << [
          task["activity"],
          task["availability"],
          task["type"],
          task["participants"],
          task["price"],
          task["accessibility"],
          task["duration"],
          task["kidFriendly"],
          task["link"],
          task["key"]
        ]
      end
    end
  end
end
