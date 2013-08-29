class ImageModeration < ActiveRecord::Base
  INAPPROPRIATE   = 'Inappropriate'
  OK = 'OK  '

  def approve?
    choice.present?
  end

  def self.hit_complete(turkee_task)
    image = Image.where(turkee_task_id: turkee_task.id).first

    if image.present?
      accepted    = false
      moderations = where(image_id: image.id) || []
      accepted    = moderations.all?{|m| m.choice == INAPPROPRIATE}

      accepted ? image.approve! : image.reject!
    end
  end

end
