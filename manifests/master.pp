# == Class: wal_e::master
class wal_e::master {
  cron { 'wal_e':
    command => "/usr/bin/envdir ${wal_e::rootdir}/env /usr/local/bin/wal-e backup-push ${wal_e::pgdata}",
    user    => 'postgres',
    minute  => '0',
    hour    => '4',
  }
}
