class php::config {
    file { "/etc/php.ini":
        ensure  =>"file",
        mode    =>0755,
        source =>("puppet:///modules/php/php.ini"),
        require =>Class['php::install'],
    }

}
