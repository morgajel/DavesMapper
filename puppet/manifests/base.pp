node default {

    include iptables
    include users
    include httpd
    include repositories
    include php
    include '::mysql::server'

    mysql_user{ 'dmap@localhost' :
        ensure                   => 'present',
        max_connections_per_hour => '0',
        max_queries_per_hour     => '0',
        max_updates_per_hour     => '0',
        max_user_connections     => '0',
        password_hash            => '*7ACE763ED393514FE0C162B93996ECD195FFC4F5',  # "changeme" was created via SELECT PASSWORD('changeme');
        #require =>Class['::mysql::client','::mysql::server']
      }
    
    mysql_grant{ 'dmap@localhost/dmillar_cartography.*' : 
        ensure     => 'present',
        options    => ['GRANT'],
        privileges => ['SELECT', 'INSERT', 'UPDATE', 'DELETE','CREATE'],
        table      => 'dmillar_cartography.*',
        user       => 'dmap@localhost',
        #require =>Class['::mysql::client','::mysql::server']
    }
    mysql_database{  'dmillar_cartography':
        ensure  => 'present',
        charset => 'utf8',
        #require =>Class['::mysql::client','::mysql::server']
    }


}

