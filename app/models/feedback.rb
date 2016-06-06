class Feedback < ActiveRecord::Base
  validates :name, :text, presence: true
end
