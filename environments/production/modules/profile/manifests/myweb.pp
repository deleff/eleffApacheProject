class profile::myweb {

  # include apache
  class { 'apache':
    default_vhost => false,
  }

  # set the port
  apache::vhost { 'first.example.com':
    port    => hiera('apacheport'),
    docroot => '/var/www/first',
  }


  # create a hash from hiera data with the Vhosts
  #$myApacheVhosts = hiera('apache::vhost', {})

  # with create resource, convert a hash into a set of resoures
  #create_resources('apache::vhost', $myApacheVhosts)

}
