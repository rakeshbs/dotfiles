#!/usr/bin/env ruby

def settings_file_path
  "~/.active_directory.settings"
end

def change_to_active_directory()
  path = `cat #{settings_file_path}`.strip.chomp
  puts `echo '#{path}'`
end

def set_active_directory (path)
  cmd = "echo '#{path}' > #{settings_file_path}"
  `#{cmd}`
end

if ARGV.include? ("s")
  pwd = `echo $PWD`.strip.chomp
  set_active_directory (pwd)
else
  change_to_active_directory
end
