# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


results = HTTParty.get("http://streeteasy.com/nyc/api/areas/search?q=*&key=#{STREETEASY_API_KEY}&format=json")
binding.pry
results_accessor = results["areas"]

counter = 0

while counter != results_accessor.length 

results_accessor.each do |area|

Area.create(
  title: area["title"],
  subtitle: area["subtitle"],
  path: area["path"],
  boundary_encoded_points_string: area["boundary_encoded_points_string"],
  level: area["level"],
  se_id: area["id"],
  se_parent_id: area["parent_id"]
    )

counter += 1

end

end