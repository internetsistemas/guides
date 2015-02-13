=begin
The FileParser class does not follow OCP because if necessary change the way you file display
or add a new form of display, you must change the existing code.
=end
class FileParser
  def initialize(file)
    @file = file
  end

  def parse
    case @file.extension
    when :xml  then parse_xml
    when :json then parse_json
    #when :x then parse_x
    #when :y then parse_y
    end
  end
end
