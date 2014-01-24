#!/usr/bin/env ruby
require 'dropcam'

dropcam = Dropcam::Dropcam.new(ENV['DROPCAM_USERNAME'],ENV['DROPCAM_PASSWORD'])
#puts dropcam.cameras.to_yaml

camera_title = ENV['DROPCAM_CAMERA'] || "Front Door"
camera = dropcam.cameras.collect{|c| c if c.title == camera_title}.compact.first
#puts camera.inspect.to_yaml

# Disable watermark
settings = camera.settings
settings["watermark.enabled"].set(false)

# returns jpg image data of the latest frame captured
screenshot = camera.screenshot.current

# Write data to disk
camera_file_title = camera.title.downcase.gsub(' ','_')
timestamp = Time.now.strftime("%Y%m%d-%H%M")
File.open(File.join(ENV['HOME'], 'Dropbox', 'Photos', 'home', "#{camera_file_title}", "#{camera_file_title}-#{timestamp}.jpg"), 'w') do |f|
  f.write(screenshot)
end

# RTSP streaming details:
#puts camera.stream.rtsp_details
