require 'spec_helper'
require 'rspec'
# require 'puppetlabs_spec_helper/module_spec_helper'


describe package('git') do
	it { should_not be_installed}
end


describe package('java-1.8.0') do
	it { should_not be_installed}
end