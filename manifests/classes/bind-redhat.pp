/*

= Class: bind::debian
Special debian class - inherits from bind::base

You should not include this class - please refer to Class["bind"]

*/
class bind::redhat inherits bind::base {
  Service["named"] {
    pattern => "/usr/sbin/named",
    restart => "/etc/init.d/named reload",
  }
}
