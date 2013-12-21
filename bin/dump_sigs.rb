require_relative "../config/boot"
require_relative "../config/environment"

f=File.new("sig_dump.yml","w")
o=Array.new
Sig.all.each do |sig|
	a = { id: sig.id, sys: sig.system.name } 
	o.push a
end

f.puts o.to_yaml
f.close
