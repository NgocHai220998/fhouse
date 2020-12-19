json.extract! house, :id, :title, :description, :address, :image, :pice, :acreage, :kind, :bedrooms, :bathrooms, :gara_size, :is_wc, :is_wf, :is_cook, :is_elevator, :is_time_free, :is_pet, :is_aircon, :is_rent, :video_url, :user_id, :city, :created_at, :updated_at
json.url house_url(house, format: :json)
