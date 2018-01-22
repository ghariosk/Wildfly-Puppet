

class { 'java' :
  package => 'java-1.8.0-openjdk-devel',
}


class {'postgresql::server':
	ip_mask_allow_all_users => '0.0.0.0/0',
	listen_addresses => '*',
	postgres_password => 'password',
}
include maven

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
  require => Wget::Fetch['Wildfly-10']
}

