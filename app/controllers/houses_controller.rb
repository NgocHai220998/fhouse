class HousesController < ApplicationController
  before_action :set_house, only: [:show, :edit, :update, :destroy]

  # GET /houses
  # GET /houses.json
  def index
    @houses = House.all
  end

  # GET /houses/1
  # GET /houses/1.json
  def show
    @house.increase_view
    @house_photos = @house.house_photos.all
  end

  # GET /houses/new
  def new
    @house = current_user.house.build
    @house_photos = @house.house_photos.build
  end

  # GET /houses/1/edit
  def edit
  end

  # POST /houses
  # POST /houses.json
  def create
    @house = current_user.house.build(house_params)

    respond_to do |format|
      if @house.save
        if params[:house_photos]
          params[:house_photos]["photo"].each do |a|
            @house_photo = @house.house_photos.create!(:photo => a)
          end
        end
        format.html { redirect_to @house, notice: "House was successfully created." }
        format.json { render :show, status: :created, location: @house }
      else
        format.html { render :new }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /houses/1
  # PATCH/PUT /houses/1.json
  def update
    respond_to do |format|
      if @house.update(house_params)
        if params[:house_photos]
          params[:house_photos]["photo"].each do |a|
            @house_photo = @house.house_photos.create!(:photo => a)
          end
        end
        format.html { redirect_to @house, notice: "House was successfully updated." }
        format.json { render :show, status: :ok, location: @house }
      else
        format.html { render :edit }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /houses/1
  # DELETE /houses/1.json
  def destroy
    @house.destroy
    respond_to do |format|
      format.html { redirect_to houses_url, notice: "House was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # import data
  def import
    House.import(params[:file])
    redirect_to houses_path, notice: "Thêm dữ liệu cho House thành công"
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_house
    @house = House.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def house_params
    params.require(:house).permit(:title, :description, :address, :image, :pice,
                                  :acreage, :kind, :bedrooms, :bathrooms, :gara_size,
                                  :is_wc, :is_wf, :is_cook, :is_elevator, :is_time_free,
                                  :is_pet, :is_aircon, :is_rent, :video_url, :user_id, :city,
                                  house_photos_attributes: [:id, :house_id, :photo])
  end
end
