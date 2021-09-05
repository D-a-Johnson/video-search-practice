# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

video_file = 'videos.csv'

puts 'Cleaning database...'
Movie.destroy_all
Category.destroy_all

puts 'Creating categories...'
Category.create!([{ name: 'Mathematik' }, { name: 'Deutsch' }, { name: 'Chemie'}, { name: 'Biologie'}, { name: 'Geschichte' }])

puts 'Creating videos'
csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
CSV.foreach(video_file, csv_options) do |row|
  t = Movie.new
  t.title = row['title']
  t.category = Category.find_by_name(row['category'])
  t.save!
end
