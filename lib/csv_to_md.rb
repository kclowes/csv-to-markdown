class CSVToMD

  def initialize(input)
    @input = input
  end

  def formatter
    body = @input[1..-1].map.with_index do |row, row_index|
      row.map.with_index do |value, value_index|
        value + " " * number_of_spaces(row_index + 1, value_index)
      end.join(" | ")
    end.join("\n")
    "#{headers}\n#{body}"
  end

  def headers
    header_line = @input[0].map.with_index do |item, index|
      item + ' ' * number_of_spaces(0, index)
    end.join(' | ')

    separator = @input[0].length.times.map do |index|
      '-' * longest_element(index)
    end.join(' | ')

    [header_line, separator].join("\n")
  end

  def number_of_spaces(row_index, column_index)
    longest_element(column_index) - @input[row_index][column_index].length
  end

  def longest_element(column_index)
    @input.map do |item|
      item[column_index]
    end.group_by(&:size).max.first
  end

end