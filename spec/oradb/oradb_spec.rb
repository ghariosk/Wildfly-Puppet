describe package('unzip') do 
	it {should be_installed}
end

desribe group('oinstall') do
	it {should exist}
end

describe group('dba') do
	it {should exist}
end

describe group('oper') do
	it {should exist}
end