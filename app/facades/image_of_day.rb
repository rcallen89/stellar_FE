class ImageOfDay
  attr_reader :date,
              :explanation,
              :title,
              :url

  def initialize(api_data)
    @date = api_data[:data][:date]
    @explanation = api_data[:data][:explanation]
    @title = api_data[:data][:title]
    @url = api_data[:data][:url]
  end

end