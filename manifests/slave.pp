# == Class: wal_e::slave
class wal_e::slave {
  $restore_command  = "restore_command = 'envdir ${wal_e::rootdir}/env /usr/local/bin/wal-e wal-fetch %f %p'"

  file { "${wal_e::pgdata}/recovery.conf":
    ensure  => file,
    owner   => 'postgres',
    group   => 'postgres',
    mode    => '0600',
    content => "${restore_command}\n",
  }
}
