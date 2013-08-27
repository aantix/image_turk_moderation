class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]

  def index
    @images = Image.in_progress.page(params[:page])
  end

  def show
  end

  def new
    @image = Image.new
  end

  def edit
  end

  def create
    @image = Image.new(image_params)

    if @image.save
      redirect_to @image, notice: 'Image was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @image.update(image_params)
      redirect_to @image, notice: 'Image was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @image.destroy
    redirect_to images_url
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_image
    @image = Image.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def image_params
    params.require(:image).permit(:name, :description, :image_path)
  end
end
