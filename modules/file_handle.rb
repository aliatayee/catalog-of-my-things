require 'json'

module HandleFiles
  def self.check_file(file)
    File.exist?("data/#{file}")
  end

  def self.read_file(file)
    File.read("data/#{file}")
  end

  def self.write_file(file, data)
    File.write("data/#{file}", data) unless data.empty?
  end

  def self.read(file)
    data = []
    data = JSON.parse(read_file(file)) if check_file(file) && read_file(file) != ''
    data
  end

  def self.write(file, data)
    write_file(file, JSON.generate(data))
    puts "\nSuccessfully written to #{file}"
  end
end
