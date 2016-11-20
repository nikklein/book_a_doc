require 'json'

class FileProcessor
  def initialize(path)
    @path = path
  end

  def to_hash
    file = File.read(@path)
    JSON.parse(file)
  end
end
