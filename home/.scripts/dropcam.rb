#!/usr/bin/env ruby

require 'dropcam'
require 'ap'

dropcam = Dropcam::Dropcam.new(ENV['DROPCAM_USERNAME'],ENV['DROPCAM_PASSWORD'])
ap dropcam.cameras

camera = dropcam.cameras.first
ap dropcam.camera

# returns jpg image data of the latest frame captured
# screenshot = camera.screenshot.current
#
# # write data to disk
# File.open("#{camera.title}.jpg", 'w') {|f| f.write(screenshot) }
#
# # access and modify settings
# # this disables the watermark on your camera stream
# settings = camera.settings
# settings["watermark.enabled"].set(false)
