# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
path = File.join(File.dirname(__FILE__), "zone.json")
records = JSON.parse(File.read(path))
records.each do |record|
    offset = record['offset']
    record['utc'].each do |city|
        region, name = city.split('/')
        next if name.nil?
        name = name.gsub('_', ' ')
        place = City.create(name: name, region: region, offset: offset, value: city)
    end
end