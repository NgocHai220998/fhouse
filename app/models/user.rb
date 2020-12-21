class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :image, ImageUploader

  has_many :house
  has_many :comment
  has_many :care
  has_one :request_host
  has_one :notification

  validates_processing_of :image
  validate :image_size_validation

  def role_enum
    ["host", "user"]
  end

  after_update do
    if (!self.user_code)
      if (self.role == "host")
        Notification.create(user_id: 1, title: "Admin đã phê duyệt bạn trở thành Host", status: "none", user_recived_id: self.id)
        self.update_attribute(:user_code, "active")
      end
    end
  end

  private

  def image_size_validation
    errors[:image] << "should be less than 10MB" if image.size > 10.megabytes
  end
end
