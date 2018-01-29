class wildfly10 {

	class { 'java' :
	  package => 'java-1.8.0-openjdk-devel',
	}


	include wget


	wget::fetch { "Wildfly-10":
	  source      => 'http://download.jboss.org/wildfly/10.1.0.Final/wildfly-10.1.0.Final.tar.gz',
	  destination => '/var/cache/wget',
	  timeout     => 0,
	  verbose     => false,
	  require => File['/var/cache/wget']
	}


	file{'/var/cache/wget':

		ensure => 'directory'
	}


	class { 'wildfly':
	  version        => '10.1.0',
	  install_source => 'http://download.jboss.org/wildfly/10.1.0.Final/wildfly-10.1.0.Final.tar.gz',
	  mgmt_user        => { username  => "test", password  => "Test1234" },
	  java_home 	=> '/usr/lib/jvm/jre-1.8.0-openjdk.x86_64/',
	  require => Wget::Fetch['Wildfly-10'],
	}


	resources { 'firewall':
	  purge => true,
	}

	firewall { "001 allow 8080":
	  dport    => [8080, 9990],
	  proto    => 'tcp',
	  action   => 'accept',
	}

	# exec {'start nohup':
	# 	command => "./wildfly.sh",
	# 	cwd => '/home/vagrant/wildfly10/scripts',
	# 	provider=> "shell",
	# 	user => "vagrant",
	# 	path => '/usr/bin',



	# }


	exec {'uninstall puppet':
		command => 'puppet resource package puppet ensure=absent 2> /dev/null || true',
		provider => "shell",
		user => 'root',
		path => '/usr/bin'
	}



}

include wildfly10



