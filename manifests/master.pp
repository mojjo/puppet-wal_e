# == Class: wal_e::master
class wal_e::master {
  cron { 'wal_e-backup-push':
    command => "/usr/bin/envdir ${wal_e::rootdir}/env /usr/local/bin/wal-e backup-push ${wal_e::pgdata}",
    user    => 'postgres',
    minute  => '0',
    hour    => '8',
  }
  cron { 'wal_e-delete-retain':
    command => "/usr/bin/envdir ${wal_e::rootdir}/env /usr/local/bin/wal-e delete --confirm retain 5",
    user    => 'postgres',
    minute  => '0',
    hour    => '9',
  }
}
