class AppBrewery::Generate
  def initialize
    @client = AppBrewery::Client.new
  end

  def task(num, format)
    response = @client.get(num, format)

    response.data
  end

  def console_task(num, format)
    return puts "invalid format" unless ['json', 'csv'].include?(format)

    response = @client.get(num, format)

    File.open("response.#{format}", 'w') do |file|
      if format == 'json'
        file.write(response.data.to_json)
      else
        file.write(response.data)
      end
    end

    puts "#{format} file generated"
  end
end
