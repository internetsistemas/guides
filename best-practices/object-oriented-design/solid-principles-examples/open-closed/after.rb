=begin
With this implementation whenever a new Parser is added,
you only need to create a new class that implements the `#parse` method and use it in the ID.
=end
class JsonParser
  def parse(file)
    "#{file}.json"
  end
end

class XmlParser
  def parse(file)
    "#{file}.xml"
  end
end

class FileParser
  def initialize(file, parser)
    @file, @parser = file, parser
  end

  def parse
    @parser.parse @file
  end
end

###

FileParser.new('file', JsonParser.new).parse
