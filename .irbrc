unless defined? ETC_IRBRC_LOADED
  require 'rubygems'
  
  # so I can use yaml (syntax: y object) for sane object printing:
  require 'yaml'
  
  # so I can use awesome print (syntax: ap object) for sane object printing:
  require 'ap'
  
  # Activate auto-completion.
  require 'irb/completion'
  
  # pretty colors!
  require 'wirble'
  Wirble.init()
  colors = Wirble::Colorize.colors.merge({
    # delimiter colors
    :comma => :white,
    :refers => :white,

    # container colors (hash and array)
    :open_hash => :white,
    :close_hash => :white,
    :open_array => :white,
    :close_array => :white,

    # object colors
    :open_object => :cyan,
    :object_class => :purple,
    :object_addr_prefix => :cyan,
    :object_addr => :light_red,
    :object_line_prefix => :cyan,
    :object_line => :yellow,
    :close_object => :cyan,

    # symbol colors
    :symbol => :blue,
    :symbol_prefix => :blue,

    # string colors
    :open_string => :green,
    :string => :green,
    :close_string => :green,

    # misc colors
    :number => :blue,
    :keyword => :blue,
    :class => :purple,
    :range => :white
  })
  Wirble::Colorize.colors = colors
  Wirble.colorize
  
  # colorize prompt
  IRB.conf[:PROMPT][:CUSTOM] = {
    :PROMPT_I => Wirble::Colorize.colorize_string(">> ", :cyan),
    :PROMPT_S => Wirble::Colorize.colorize_string(">> ", :green),
    :PROMPT_C => "#{Wirble::Colorize.colorize_string('..', :cyan)} ",
    :PROMPT_N => "#{Wirble::Colorize.colorize_string('..', :cyan)} ",
    :RETURN   => "#{Wirble::Colorize.colorize_string('→', :light_red)} %s\n"
  }
  IRB.conf[:PROMPT_MODE] = :CUSTOM

  # Setup permanent history.
  HISTFILE = "~/.irb_history"
  MAXHISTSIZE = 1000
  begin
    histfile = File::expand_path(HISTFILE)
    if File::exists?(histfile)
      lines = IO::readlines(histfile).collect { |line| line.chomp }
      puts "Read #{lines.nitems} saved history commands from '#{histfile}'." if $VERBOSE
      Readline::HISTORY.push(*lines)
    else
      puts "History file '#{histfile}' was empty or non-existant." if $VERBOSE
    end
    Kernel::at_exit do
      lines = Readline::HISTORY.to_a.reverse.uniq.reverse
      lines = lines[-MAXHISTSIZE, MAXHISTSIZE] if lines.nitems > MAXHISTSIZE
      puts "Saving #{lines.length} history lines to '#{histfile}'." if $VERBOSE
      File::open(histfile, File::WRONLY|File::CREAT|File::TRUNC) { |io| io.puts lines.join("\n") }
    end
  rescue => e
    puts "Error when configuring permanent history: #{e}" if $VERBOSE
  end
  
  #activerecord logging
  script_console_running = ENV.include?('RAILS_ENV') && IRB.conf[:LOAD_MODULES] && IRB.conf[:LOAD_MODULES].include?('console_with_helpers')
  rails_running = ENV.include?('RAILS_ENV') && !(IRB.conf[:LOAD_MODULES] && IRB.conf[:LOAD_MODULES].include?('console_with_helpers'))
  irb_standalone_running = !script_console_running && !rails_running

  if script_console_running
    require 'logger'
    Object.const_set(:RAILS_DEFAULT_LOGGER, Logger.new(STDOUT))
  end

  ETC_IRBRC_LOADED=true
end