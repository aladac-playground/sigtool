# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# systems = File.readlines("systems.csv")
# 
# systems.each do |line|
#   line=line.chomp
#   line=line.split("\t")
#   id = line[0]
#   cons_id = line[1]
#   name = line[2]
#   System.create(id: id, cons_id: cons_id, name: name)
# end

systems = YAML.load_file("static/systems.yml")
systems.each do |system|
  System.create(system)
end

cons = YAML.load_file("static/cons.yml")
cons.each do |con|
  Cons.create(con)
end

regs = YAML.load_file("static/regions.yml")
regs.each do |reg|
  Region.create(reg)
end