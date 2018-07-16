require "wrap_word/version"

module WrapWord
  def WrapWord::wrap(string, column)
    return string if string.length <= column
    boundary = string[0, column].rindex(" ")
    return string[0, boundary].strip + "\n" + wrap(string[boundary + 1..-1].strip, column) unless boundary.nil?
    return string[0, column].strip + "\n" + wrap(string[column..-1].strip, column)
  end
end
