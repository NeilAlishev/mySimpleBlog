class Feedback
  include ActiveModel::Model
  attr_accessor :name, :text

  validates :name, :text, presence: true

  def attributes=(hash)
    hash.each do |key, value|
      send("#{key}=", value)
    end
  end
end
