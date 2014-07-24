class CSVToMD

  def initialize(input)
    @input = input
  end

  def formatter
    section = 0
    index = 1
    string = headers(0)
    while index < @input.length
      string <<
        @input[index][section] + ' ' * how_many_fn_spaces(index) + ' | ' +
          @input[index][section + 1] + ' ' * how_many_ln_spaces(index) + ' | ' +
          @input[index][section + 2] + "\n"
      index += 1
    end
    string
  end

  def headers(index)
    @input.first[index] + ' ' * how_many_fn_spaces(index) + ' | ' + @input.first[index + 1] + ' ' * how_many_ln_spaces(index) + ' | ' + @input.first[index + 2] + "\n" +
      '-' * longest_first_name + ' | ' + '-' * longest_last_name + ' | ' + '-' * longest_address + "\n"
  end

  def how_many_fn_spaces(index)
    longest_first_name - @input[index][0].length
  end

  def how_many_ln_spaces(index)
    longest_last_name - @input[index][1].length
  end

  def longest_first_name
    first_name_array = @input.map do |item|
      item[0]
    end
    first_name_array.group_by(&:size).max.first
  end

  def longest_last_name
    last_name_array = @input.map do |item|
      item[1]
    end
    last_name_array.group_by(&:size).max.first
  end

  def longest_address
    address_array = @input.map do |item|
      item[2]
    end
    address_array.group_by(&:size).max.first
  end

end