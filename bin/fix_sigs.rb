require_relative "../config/boot"
require_relative "../config/environment"

sigs = YAML.load_file("sig_dump.yml")


sigs.each do |sig|
	sys = sig[:sys]
	id = sig[:id]
	s=Sig.find(id)
	system=System.where(name: sys).first
	s.system_id=system.id
	s.save
end
