class House < ApplicationRecord
  has_many :house_photos
  belongs_to :user
  has_many :comment
  has_many :care
  accepts_nested_attributes_for :house_photos, allow_destroy: true, reject_if: proc { |attributes| attributes["photo"].blank? }

  def increase_view
    if (self.view)
      update_attribute :view, (self.view + 1)
    else
      update_attribute :view, 1
    end
  end
end
