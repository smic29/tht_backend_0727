class TasksController < ApplicationController
  before_action :set_service, only: :test

  def generate
    if !params[:num] && !params[:format]
      puts "number of times not indicated"
      return
    end

    if is_valid_format?(params[:format])
      response = @service.task(params[:num].to_i, params[:format])
      respond_to do |format|
        format.json { send_data response, filename: "taskjson-#{Date.today}.txt", type: 'text/txt; charset=UTF-8; header=present', disposition: 'attachment' }
        format.csv { send_data response, filename: "taskcsv-#{Date.today}.csv", type: 'text/csv; charset=UTF-8; header=present', disposition: 'attachment' }
      end
    end
  end

  private

  def set_service
    @service = AppBrewery::Generate.new
  end

  def is_valid_format?(format)
    valid_formats = ['json', 'csv', 'console']

    valid_formats.include?(format)
  end
end