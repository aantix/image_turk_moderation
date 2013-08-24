class Image < ActiveRecord::Base


  def self.unprocessed
    where(processed: false)
  end

  def self.process_items
    unprocessed.each do |image|

      Turkee::TurkeeTask.create_hit(host, "Is the given image pornographic or not?.",
                                    hit_description, Image, num_assignments, reward,
                                    lifetime, duration, {}, {:url_id => url.id}, {})

      image.processed = true
      image.save!
    end
  end
end
