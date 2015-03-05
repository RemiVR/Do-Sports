# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
10.times.with_index do |index|
	User.create(name: 'blob', email: "blob#{index}@gmail.com", password: "1234", password_confirmation: "1234" group_id: 1)
end
# Sport.create(title: 'Football')
# Sport.create(title: 'Basketball')
# Sport.create(title: 'Volleyball')
# Sport.create(title: 'Tennis')
# Sport.create(title: 'Hockey')
