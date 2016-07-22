# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
countries = ["Malaysia", "Singapore"]
states = {"Malaysia": ["Penang","Selangor","Johor","Sabah","Sarawak","Malacca","Perak","Kedah","Kelantan","Pahang","Negeri Sembilan","Perlis"],
		  "Singapore": ["Singapore"]
		}
cities = {"Selangor": ["Kelana Jaya","Damansara","Bukit Bintang","Cheras"]}

countries.each_with_index do |a, i|
	Country.create(description: countries[i])
end

states.each do |key, value|
	@country = Country.find_by(description: key)
	value.each_with_index do |b, index|
		@country.states.create(description: value[index])
	end
end

cities.each do |k,v|
	@state = State.find_by(description: k)
	@country = @state.country
	v.each_with_index do |c, idx|
		@state.cities.create(description: v[idx], country_id: @country.id)
	end
end