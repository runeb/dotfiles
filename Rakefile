require "yaml"
require 'erb'
require 'fileutils'
require 'pry'

class Memory
  @@_file = File.dirname(__FILE__) + '/build/memory.yml'
  @@_mem = nil

  def lookup(value)
    @@_mem ||= self.read
    @@_mem[value]
  end

  def save(key, value)
    @@_mem ||= self.read
    @@_mem[key] = value

    File.open(@@_file, 'w') do |f|
      f.puts YAML::dump(@@_mem)
    end
    FileUtils.chmod 0600, @@_file
  end

  private
  def read
    if File.exist? @@_file
      YAML::load(File.read(@@_file))
    else
      {}
    end
  end
end

def get_value(name)
  mem = Memory.new
  old_value = mem.lookup(name)
  begin
    print(name)
    print " (enter to keep #{old_value})" if old_value
    print " : "
    STDOUT.flush
    res = STDIN.gets.chomp
  end while res == "" && !old_value

  value = (res == "") ? old_value : res
  binding.pry
  mem.save(name, value)

  value
end

desc "Build the ERB files if modified"
task :build do
  puts "Building"
  files = Dir['**/*.erb']

  files.each do |file|
    next if file =~ /build/

    tpl = ERB.new(File.read(file))

    # Make sure the dir exists
    outfile = './build/' + file
    FileUtils.mkdir_p File.dirname(outfile)

    File.open(outfile, 'w') do |f|
      f.puts tpl.result(binding)
    end
  end
end

