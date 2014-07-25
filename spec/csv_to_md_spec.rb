require 'rspec'
require 'csv_to_md'

describe CSVToMD do
  it 'will put characters into a string' do
    input = [["First", "Last", "Address"],
             ["Annamarie", "Romaguera", "9446 Schroeder Squares"],
             ["Sebastian", "Hessel", "114 Frederic Centers"],
             ["Marlon", "Hahn", "307 Bradtke Grove"]]
    expected = [
      "First     | Last      | Address               ",
      "--------- | --------- | ----------------------",
      "Annamarie | Romaguera | 9446 Schroeder Squares",
      "Sebastian | Hessel    | 114 Frederic Centers  ",
      "Marlon    | Hahn      | 307 Bradtke Grove     ",
    ].join("\n")

    actual = CSVToMD.new(input).formatter
    expect(actual).to eq(expected)
  end

  it 'will give the longest first name' do
    input = [["First", "Last", "Address"],
             ["Annamarie", "Romaguera", "9446 Schroeder Squares"],
             ["Sebastian", "Hessel", "114 Frederic Centers"],
             ["Marlon", "Hahn", "307 Bradtke Grove"]]
    actual = CSVToMD.new(input).longest_element(0)
    expect(actual).to eq(9)
  end

  it 'will give the longest last name' do
    input = [["First", "Last", "Address"],
             ["Annamarie", "Romaguera", "9446 Schroeder Squares"],
             ["Sebastian", "Hessel", "114 Frederic Centers"],
             ["Marlon", "Hahn", "307 Bradtke Grove"]]
    actual = CSVToMD.new(input).longest_element(1)
    expect(actual).to eq(9)
  end

  it 'will give the longest address' do
    input = [["First", "Last", "Address"],
             ["Annamarie", "Romaguera", "9446 Schroeder Squares"],
             ["Sebastian", "Hessel", "114 Frederic Centers"],
             ["Marlon", "Hahn", "307 Bradtke Grove"]]
    actual = CSVToMD.new(input).longest_element(2)
    expect(actual).to eq(22)
  end

  it 'will allow more than three sections' do
    input = [["First", "Last", "Address", "Phone"],
             ["Annamarie", "Romaguera", "9446 Schroeder Squares", "1234"],
             ["Sebastian", "Hessel", "114 Frederic Centers", "12"],
             ["Marlon", "Hahn", "307 Bradtke Grove", "12456"]]
    expected = [
      "First     | Last      | Address                | Phone",
      "--------- | --------- | ---------------------- | -----",
      "Annamarie | Romaguera | 9446 Schroeder Squares | 1234 ",
      "Sebastian | Hessel    | 114 Frederic Centers   | 12   ",
      "Marlon    | Hahn      | 307 Bradtke Grove      | 12456",
    ].join("\n")

    actual = CSVToMD.new(input).formatter
    expect(actual).to eq(expected)
  end

  it 'will give the longest phone number' do
    input = [["First", "Last", "Address", "Phone"],
             ["Annamarie", "Romaguera", "9446 Schroeder Squares", "1234"],
             ["Sebastian", "Hessel", "114 Frederic Centers", "12"],
             ["Marlon", "Hahn", "307 Bradtke Grove", "12456"]]
    actual = CSVToMD.new(input).longest_element(2)
    expect(actual).to eq(22)
  end

  it 'will give the number of spaces needed' do
    input = [["First", "Last", "Address", "Phone"],
             ["Annamarie", "Romaguera", "9446 Schroeder Squares", "1234"],
             ["Sebastian", "Hessel", "114 Frederic Centers", "12"],
             ["Marlon", "Hahn", "307 Bradtke Grove", "12456"]]
    actual = CSVToMD.new(input).number_of_spaces(0, 0)
    expect(actual).to eq(4)
  end
end