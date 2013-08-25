class ImageModeration < ActiveRecord::Base
  NUDITY   = 'nudity'
  NONUDITY = 'no nudity'

  def approve?
    choice.present?
  end

  def self.hit_complete(turkee_task)
    image       = Image.where(turkee_task_id: turkee_task.id).first
    accepted    = false

    unless image
      moderations = where(image_id: image.id) || []
      accepted    = moderations.all?{|m| m.choice == NUDITY}
    end

    accepted ? image.approve! : image.reject!
  end

end
