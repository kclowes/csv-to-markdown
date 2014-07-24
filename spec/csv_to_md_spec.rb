require 'rspec'
require 'csv_to_md'

describe CSVToMD do
  it 'will put characters into a string' do
    input = [["First", "Last", "Address"],
             ["Annamarie", "Romaguera", "9446 Schroeder Squares"],
             ["Sebastian", "Hessel", "114 Frederic Centers"],
             ["Marlon", "Hahn", "307 Bradtke Grove"]]
    expected = <<-BEGIN
First     | Last      | Address
--------- | --------- | ----------------------
Annamarie | Romaguera | 9446 Schroeder Squares
Sebastian | Hessel    | 114 Frederic Centers
Marlon    | Hahn      | 307 Bradtke Grove
    BEGIN

    actual = CSVToMD.new(input).formatter
    expect(actual).to eq(expected)
  end

  it 'will give the longest first name' do
    input = [["First", "Last", "Address"],
             ["Annamarie", "Romaguera", "9446 Schroeder Squares"],
             ["Sebastian", "Hessel", "114 Frederic Centers"],
             ["Marlon", "Hahn", "307 Bradtke Grove"]]
    actual = CSVToMD.new(input).longest_first_name
    expect(actual).to eq(9)
  end

  it 'will give the longest last name' do
    input = [["First", "Last", "Address"],
             ["Annamarie", "Romaguera", "9446 Schroeder Squares"],
             ["Sebastian", "Hessel", "114 Frederic Centers"],
             ["Marlon", "Hahn", "307 Bradtke Grove"]]
    actual = CSVToMD.new(input).longest_last_name
    expect(actual).to eq(9)
  end

  it 'will give the longest address' do
    input = [["First", "Last", "Address"],
             ["Annamarie", "Romaguera", "9446 Schroeder Squares"],
             ["Sebastian", "Hessel", "114 Frederic Centers"],
             ["Marlon", "Hahn", "307 Bradtke Grove"]]
    actual = CSVToMD.new(input).longest_address
    expect(actual).to eq(22)
  end

end