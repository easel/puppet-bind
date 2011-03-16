/*

= Definition: bind::forwarders

Set up bind forwards

Arguments:
 *$forwarders*:  List of IP addresses to forward DNS resolution to


*/
define bind::forwarders($forwarders=false) {
    file {"/etc/bind/named.conf.options":
      ensure => file,
      owner => root,
      group => root,
      mode => 0755,
      content => template("bind/named.conf.options.erb"),
      notify => Service["bind9"],
    }
}