class Comment < ApplicationRecord
  belongs_to :house
  belongs_to :user
end
