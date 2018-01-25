require 'spec_helper'
require 'rspec'
# require 'puppetlabs_spec_helper/module_spec_helper'


describe package('git') do

	it { should be_installed}
end