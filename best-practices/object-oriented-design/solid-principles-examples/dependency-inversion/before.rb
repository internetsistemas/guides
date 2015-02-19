# This class does not follow DIP because the class has direct dependency with JsonParser.
class FileParser
  def initialize(file)
    @file = file
  end

  def parse
    JsonParse.new(@file).parse
  end
end
