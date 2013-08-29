class Image < ActiveRecord::Base
  include ActiveModel::Transitions

  TITLE           = "Is this image inappropriate?"
  DESCRIPTION     = "Look at the photo below.  Click the inappropriate button if you see an image with one of the following criteria. Otherwise click 'OK'"
  NUM_ASSIGNMENTS = 3 # Per HIT
  REWARD          = 0.03
  LIFETIME        = 2 # Days
  DURATION        = 1 # Hours
  #QUALIFICATIONS  = {:approval_rate => {:gt => 70}}
  QUALIFICATIONS  = {}

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

  def self.unprocessed
    where(state: 'unprocessed')
  end

  def self.in_progress
    where(state: 'in_progress')
  end

  def self.process_items
    urls = Set.new
    unprocessed.each do |image|
      turkee_task = Turkee::TurkeeTask.create_hit(host, TITLE, DESCRIPTION, ImageModeration,
                                                  NUM_ASSIGNMENTS, REWARD, LIFETIME, DURATION,
                                                  QUALIFICATIONS, {:image_id => image.id})

      urls << turkee_task.hit_url

      image.turkee_task_id = turkee_task.id
      image.post_hit!
    end

    puts "HIT URL(s) :"
    urls.each{|url| puts "  #{url}"}
  end

  def self.host
    protocol = ImageTurkModeration::Application.config.action_mailer.default_url_options[:protocol] || "http"
    host     = ImageTurkModeration::Application.config.action_mailer.default_url_options[:host]

    "#{protocol}://#{host}/"
  end
end
