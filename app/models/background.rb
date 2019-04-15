class Background
  attr_reader :id,
              :image

  def initialize(data)
    @id = data[:results][0][:id]
    @image = data[:results][0][:urls][:raw]
  end
end
