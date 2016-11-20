require 'json'

class FileProcessor
  def initialize(path)
    @path = path
  end

  def to_hash
    JSON.parse(load_file)
  end

  def load_file
    File.read(@path)
  end
end
