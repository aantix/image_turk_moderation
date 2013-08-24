class Image < ActiveRecord::Base


  def self.unprocessed
    where(processed: false)
  end
end
