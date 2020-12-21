class RequestHost < ApplicationRecord
  belongs_to :user

  def status_enum
    ["pending", "resolve"]
  end
end
