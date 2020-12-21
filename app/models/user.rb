class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :image, ImageUploader

  has_many :house
  has_many :comment
  has_many :care

  validates_processing_of :image
  validate :image_size_validation

  def role_enum
    ["admin", "host", "user"]
  end

  def active_host
    update role: "host"
  end

  private

  def image_size_validation
    errors[:image] << "should be less than 2.5MB" if image.size > 2.5.megabytes
  end
end
