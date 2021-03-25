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
  require 'amazing_print'
  AmazingPrint.pry!
rescue LoadError => e
  puts 'gem install amazing_print  # <-- highly recommended'
end
