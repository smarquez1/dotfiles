# === EDITOR ===
Pry.editor = 'nvim'

# == PLUGINS ===
# == Pry-Nav - Using pry as a debugger ==
if defined?(PryByebug) || defined?(PryNav)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
end

# == amazing_print - great syntax colorized printing
begin
  require 'awesome_print'
  AwesomePrint.pry!
rescue LoadError => e
  puts 'gem install awesome_print  # <-- highly recommended'
end
