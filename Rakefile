require 'rake'
require 'rspec/core/rake_task'
require 'net/ssh'

require_relative 'spec/spec_helper.rb'


hosts = %w(
	wildfly.local
	oradb.local
)

# RSpec::Core::RakeTask.new(:spec) do |t|
#   t.pattern = 'spec/*/*_spec.rb'
# end

# task :default => :spec



task :spec => 'spec:all'

namespace :spec do
  task :all => hosts.map {|h| 'spec:' + h.split('.')[0] }
  hosts.each do |host|
    short_name = host.split('.')[0]
    role       = short_name.match(/[^0-9]+/)[0]


    desc "Run serverspec to #{host}"
    RSpec::Core::RakeTask.new(short_name) do |t|
      ENV['TARGET_HOST'] = host
      t.pattern = "spec/{base,#{role}}/*_spec.rb"
    end
  end
end




task :inspec do
	directory = File.dirname(__FILE__)
	if ARGV.length() >= 2
		ARGV.shift
		ARGV.each  do |a|
			task a.to_sym do
				# sh("inspec exec #{directory}/spec/#{a}/*_spec.rb -t ssh://#{INSPEC_USER}@#{a}.local --password=#{INSPEC_PASS}")
	  		end
		end
	else
		
			# sh("inspec exec #{directory}/spec/#{host}/*_spec.rb -t ssh://#{INSPEC_USER}@#{host}.local --password=#{INSPEC_PASS}")
			
			directories = RAKE_INSPEC

			directories = directories.split(' ')
			array = []
			directories.each do |dir|
				unless dir == "spec_helper.rb"
					array << dir
				end
			end

			array.each do |dir|
				#sh("inspec exec #{directory}/spec/#{dir}/*_spec.rb -t ssh://#{INSPEC_USER}@##{dir}.local --password=#{INSPEC_PASS}")
				puts "Hello #{dir}"
			end

		
	end

	
end