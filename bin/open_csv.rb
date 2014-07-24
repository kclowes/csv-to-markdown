require 'csv'
require '../lib/csv_to_md'

file = CSV.read(File.expand_path('../data/people.csv', __dir__))

p CSVToMD.new(file).formatter