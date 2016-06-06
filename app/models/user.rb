class User < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :articles, dependent: :destroy

  validates :full_name, presence: true, uniqueness: true

  mount_uploader :avatar, AvatarUploader
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable

  validates_integrity_of :avatar
  validates_processing_of :avatar
  validates_download_of :avatar
end
