	exec {'start nohup':
		# command => "nohup /opt/wildfly/bin/standalone.sh -b 0.0.0.0 -bmanagement 0.0.0.0 &",
		command => "./test.sh",
		cwd => '/home/vagrant/wildflys',
		provider=> "shell",
		user => "vagrant",
		path => '/usr/bin',
	}	


