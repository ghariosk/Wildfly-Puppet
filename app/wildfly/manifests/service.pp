# class wildfly10::firewall inherits wildfly10 {
# 	resources { 'firewall':
# 	  purge => true,
# 	}

# 	firewall { "001 allow 8080":
# 	  dport    => [8080, 9990],
# 	  proto    => 'tcp',
# 	  action   => 'reject',
# 	}
# }




