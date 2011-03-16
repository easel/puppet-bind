/*

= definition: bind::ddns-client

Registers a helper script on interface up/down to register with dynamic dns

*/
define bind::ddns-client(
        $zone="local",
        $server=false) 
{

    case $operatingsystem {
        "Ubuntu": { 
            file { "/etc/network/if-up.d/ddns-register.sh":
                ensure => file,
                owner => root,
                group => root,
                mode => 0700,
                content => template("bind/ddns-register.sh.erb"),
            }            
        }
        default: { fail "Unknown $operatingsystem" }
    }
}