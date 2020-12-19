module ApplicationHelper
  def avatar_url(user)
    if user.image.attached?
      url_for(user.image)
    else
      ActionController::Base.helpers.asset_path("default_img.svg")
    end
  end
end
