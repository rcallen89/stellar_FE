class ImageOfDay
  attr_reader :date,
              :explanation,
              :title,
              :url

  def initialize(api_data)
    @date = api_data[:date]
    @explanation = api_data[:explanation]
    @title = api_data[:title]
    @url = api_data[:url]
  end

end