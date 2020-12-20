class CaresController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    care = Care.new house_params
    user = User.find house_params[:user_id]
    respond_to do |format|
      if care.save
        format.json { render json: care, status: :created }
      else
        format.json { render json: care.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    care = Care.find(params[:id])
    care.destroy
    respond_to do |format|
      format.json { render json: { status: true }, status: :created }
    end
  end

  private

  def house_params
    params.require(:data).permit(:user_id, :house_id)
  end
end
