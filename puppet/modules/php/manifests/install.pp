
class php::install {

    package{ ["php", 'php-mysql' ]:
        ensure =>present,
        require =>Class['httpd'],
        notify =>Class['httpd::service'],

    }

}
