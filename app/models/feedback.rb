class Feedback
  include ActiveModel::Model
  attr_accessor :name, :text, :email, :subject

  validates :name, :text, :email, :subject, presence: true

  def attributes=(hash)
    hash.each do |key, value|
      send("#{key}=", value)
    end
  end
end
