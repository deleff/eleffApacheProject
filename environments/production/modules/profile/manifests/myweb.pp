class profile::myweb ( $portnum = hiera('apacheport') ) {

  # include apache
  class { 'apache':
    default_vhost => false,
  }

  # set the port
  apache::vhost { 'first.example.com':
    port    => $portnum,
    docroot => '/var/www/first',
  }

   # disable the appropriate firewalls
   firewall { '100 allow http and https access':
    dport   => [80, 443, 61613, 8140, $portnum],
    proto  => tcp,
    action => accept,
  }
  

}
