# From: http://lucapette.com/pry/pry-everywhere/
if defined?(::Bundler)
  global_gemset = ENV['GEM_PATH'].split(':').grep(/ruby.*@global/).first
  if global_gemset
    all_global_gem_paths = Dir.glob("#{global_gemset}/gems/*")
    all_global_gem_paths.each do |p|
      gem_path = "#{p}/lib"
      $LOAD_PATH << gem_path
    end
  end
end

require "rubygems" unless defined? Gem # Ruby 1.8 only
# Use Pry everywhere, if it fails, use IRB
begin
  require 'pry'
  Pry.start
rescue
  puts 'Pry failed to load... loading IRB instead'
  require 'irbtools'
end
exit
