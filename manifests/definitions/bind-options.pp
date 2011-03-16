/*

= Definition: bind::forwarders

Set up bind forwards

Arguments:
 *$forwarders*:  List of IP addresses to forward DNS resolution to
 *$recursives*:  List of IP CIDR netblocks to allow recursive resolution for


*/
define bind::options($forwarders=false, $recursives=false) {
    file {"/etc/bind/named.conf.options":
      ensure => file,
      owner => root,
      group => root,
      mode => 0755,
      content => template("bind/named.conf.options.erb"),
      notify => Service["bind9"],
    }
}