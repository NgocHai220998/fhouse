module ApplicationHelper
  def avatar_url(user)
    if user.image.attached?
      url_for(user.image)
    else
      ActionController::Base.helpers.asset_path("default_img.svg")
    end
  end

  def find_user(id)
    User.find id
  end

  def find_house(id)
    House.find id
  end

  def average_star(id)
    house = find_house(id)

    if house.comment.count > 0
      sum = 0
      house.comment.each do |comment|
        sum += comment.star
      end

      sum / house.comment.count
    else
      5
    end
  end

  def house_by_city(city)
    House.where city: city
  end

  def notification_by(user_recived_id)
    Notification.where(user_recived_id: user_recived_id).reverse
  end

  def house_by_popular
    House.order(view: :desc)
  end
end
