# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'tasks/turkee'

ImageTurkModeration::Application.load_tasks


desc "Posts to Mechanical Turk all images that haven't been approved or not."
task :moderate_images => :environment do
  Image.process_items
end