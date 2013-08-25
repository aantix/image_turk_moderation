class Image < ActiveRecord::Base
  include ActiveModel::Transitions

  state_machine auto_scopes: true do
    state :unprocessed  # hasn't been posted to MT
    state :in_progress  # posted in MT but unfinished
    state :approved     # non-nude
    state :rejected     # nudity present

    event :post_hit do
      transitions to: :in_progress, from: :unprocessed
    end
    event :approve do
      transitions to: :approved, from: [:in_progress, :unprocessed]
    end
    event :reject do
      transitions to: :rejected, from: [:in_progress, :unprocessed]
    end
  end

  TITLE           = "Detect nudity in photos"
  DESCRIPTION     = "Look at the photo below.  Click the nudity button if you see a nipple, otherwise click 'no nudity'."
  NUM_ASSIGNMENTS = 3 # Per HIT
  REWARD          = 0.03
  LIFETIME        = 2 # Days
  DURATION        = 1 # Hours
  QUALIFICATIONS  = {:approval_rate => {:gt => 70}}

  def self.unprocessed
    where(state: 'unprocessed')
  end

  def self.process_items
    unprocessed.each do |image|
      turkee_task = Turkee::TurkeeTask.create_hit(host, TITLE, DESCRIPTION, Image,
                                                  NUM_ASSIGNMENTS, REWARD, LIFETIME, DURATION,
                                                  QUALIFICATIONS, {:image_id => image.id})

      image.turkee_task_id = turkee_task.id
      image.post_hit!
    end
  end

  def self.host
    protocol = ImageTurkModeration::Application.config.action_mailer.default_url_options[:protocol] || "http"
    host     = ImageTurkModeration::Application.config.action_mailer.default_url_options[:host]

    "#{protocol}://#{host}/"
  end
end
