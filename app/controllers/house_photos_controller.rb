class HousePhotosController < ApplicationController
  def destroy
    @house_photo = HousePhoto.find(params[:id])
    house = @house_photo.house
    @house_photo.destroy
    respond_to do |format|
      format.html { redirect_to house_url(house), notice: "House photo was successfully destroyed." }
    end
  end
end
