class SpacePeople

  attr_reader :data

  def initialize
    @data = StellarService.get_people
  end

  def name_crafts
    @data.reduce({}) do |acc, object|
      if acc.keys.include?(object[:craft])
        acc[object[:craft]] << object[:name]
      else
        acc[object[:craft]] = [object[:name]]
      end
      acc
    end
  end
end
