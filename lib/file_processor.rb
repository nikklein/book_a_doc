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

  def write_to_file(dataset)
    File.open(@path, 'w') { |file| file.write(dataset) }
  end

  private

  def pretty_generate(dataset)
    JSON.pretty_generate(dataset)
  end
end
