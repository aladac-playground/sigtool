# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


systems = File.readlines("systems.csv")

systems.each do |line|
  line=line.chomp
  line=line.split("\t")
  id = line[0]
  cons_id = line[1]
  name = line[2]
  System.create(id: id, cons_id: cons_id, name: name)
end