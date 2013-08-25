class ImageModerationsController < ApplicationController
  before_action :set_image_moderation, only: [:show, :edit, :update, :destroy]

  def new
    @disabled         = Turkee::TurkeeFormHelper::disable_form_fields?(params)
    @image            = Image.find(params[:image_id])
    @image_moderation = ImageModeration.new
  end

  private
    def set_image_moderation
      @image_moderation = ImageModeration.find(params[:id])
    end

    def image_moderation_params
      params.require(:image_moderation).permit(:image_id, :choice)
    end
end
