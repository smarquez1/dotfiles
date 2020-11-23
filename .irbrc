begin
  require "pry"
  Pry.start
  exit
rescue LoadError => e
  warn "=> Unable to load pry, try running bundle install pry"
rescue NameError => e
  warn "=> Unable to load pry, try updating pry-byebug || byebug"
end
