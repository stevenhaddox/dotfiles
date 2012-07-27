###############################################################################
# Pry Rails Integration                                                       #
# From: https://github.com/pry/pry/wiki/Setting-up-Rails-or-Heroku-to-use-Pry #
###############################################################################

# Load plugins (only those I whitelist)
Pry.config.should_load_plugins = false
Pry.plugins["doc"].activate!

# Launch Pry with access to the entire Rails stack.
# If you have Pry in your Gemfile, you can pass: ./script/console --irb=pry instead.
# If you don't, you can load it through the lines below :)
rails = File.join Dir.getwd, 'config', 'environment.rb'

if File.exist?(rails) && ENV['SKIP_RAILS'].nil?
  require rails
  
  if Rails.version[0..0] == "2"
    require 'console_app'
    require 'console_with_helpers'
  elsif Rails.version[0..0] == "3"
    require 'rails/console/app'
    require 'rails/console/helpers'
  else
    warn "[WARN] cannot load Rails console commands (Not on Rails2 or Rails3?)"
  end
end


# vim FTW
Pry.config.editor = "vim"

# Make pry polite
Pry.config.hooks.add_hook(:after_session, :say_bye) do
  puts "Sayanora Steven!"
end

# Prompt with ruby version
#Pry.prompt = [proc { |obj, nest_level| "#{RUBY_VERSION} (#{obj}):#{nest_level} > " }, proc { |obj, nest_level| "#{RUBY_VERSION} (#{obj}):#{nest_level} * " }]

#%w{map_by_method hirb}.each { |gem| require gem }

# Toys methods
# Stolen from https://gist.github.com/807492
class Array
  def self.toy(n=10, &block)
    block_given? ? Array.new(n,&block) : Array.new(n) {|i| i+1}
  end
end

class Hash
  def self.toy(n=10)
    Hash[Array.toy(n).zip(Array.toy(n){|c| (96+(c+1)).chr})]
  end
end