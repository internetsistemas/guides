# Using DIP FileParser now do not depend of only one kind of parser.
# Is more flexible and easier to add new Parsers now, just need to build a new Parser and inject it when create a FileParser.
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
