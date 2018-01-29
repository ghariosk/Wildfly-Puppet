# require 'spec_helper'

describe port(80) do
  it { should_not be_listening }
end

describe package('git') do
	it { should_not be_installed } 
end

describe package('wget') do
	it { should be_installed }
end


describe package('java-1.8.0-openjdk-devel') do
	it { should be_installed}
end

describe command('java') do
	it {should exist}
end

# describe command('java -version') do
# 	its('stderr') { should contain '1.8.0' }
# end

describe port(8080) do
	it {should be_listening}
end

describe port(9990) do
	it {should be_listening}
end

describe file('/etc/default/wildfly.conf') do
	its('content'){ should match "JAVA_HOME=\"/usr/lib/jvm/jre-1.8.0-openjdk.x86_64/\""}
end


describe service('wildfly') do
	it {should be_enabled}
end

describe file("/var/cache/wget/wildfly-10.1.0.Final.tar.gz") do
	it { should exist } 
end

control 'Puppet' do

	title 'should not be installed'
	desc 'should not be installed'
	describe command('puppet').exist? do

		it {should eq false}
	end
end

describe command('curl 127.0.0.1:8080') do
  its(:stdout) { should match 'Welcome to WildFly 10'}
end
