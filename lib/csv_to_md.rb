class CSVToMD

  def initialize(input)
    @input = input
  end

  def formatter
    category_number = 0
    string = headers(0, category_number)
    row = 1
    while row < @input.length
      string <<
        @input[row][category_number] + ' ' * number_of_spaces(row, category_number) + ' | ' +
          @input[row][category_number + 1] + ' ' * number_of_spaces(row, category_number + 1) + ' | ' +
          @input[row][category_number + 2] + ' ' * number_of_spaces(row, category_number + 2) + ' | ' +
          @input[row][category_number + 3] + "\n"
      row += 1
    end
    string
  end

  def headers(row, category_number)
    @input[row][category_number] + ' ' * number_of_spaces(row, category_number) + ' | ' +
      @input[row][category_number + 1] + ' ' * number_of_spaces(row, category_number + 1) + ' | ' +
      @input[row][category_number + 2] + ' ' * number_of_spaces(row, category_number + 2) + ' | ' +
      @input[row][category_number + 3] +
      "\n" +
      '-' * longest_element(category_number) + ' | ' +
      '-' * longest_element(category_number + 1) + ' | ' +
      '-' * longest_element(category_number + 2) +  ' | ' +
      '-' * longest_element(category_number + 3) + "\n"
  end

  def number_of_spaces(row, category_number)
    longest_element(category_number) - @input[row][category_number].length
  end

  def longest_element(category_number)
    longest_element_array = @input.map do |item|
      item[category_number]
    end
    longest_element_array.group_by(&:size).max.first
  end

end