unless ENV['DISABLE_PRY_RAILS']
  begin
    require "pry"
    Pry.start
    exit
  rescue LoadError => e
    warn "=> Unable to load pry"
  end
end
