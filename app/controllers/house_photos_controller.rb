class HousePhotosController < ApplicationController
  def destroy
    @house_photo = HousePhoto.find(params[:id])
    house = @house_photo.house
    @house_photo.destroy
    respond_to do |format|
      format.html { redirect_to house_url(house), notice: "House photo was successfully destroyed." }
    end
  end

  # import data
  def import
    HousePhoto.import(params[:file])
    redirect_to houses_path, notice: "Thêm dữ liệu cho bảng HousePhoto thành công"
  end
end
