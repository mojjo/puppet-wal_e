# == Class: wal_e::slave
class wal_e::slave {
  $recovery = "${wal_e::pgdata}/recovery.conf"

  concat { $recovery:
    owner   => 'postgres',
    group   => 'postgres',
    mode    => '0640',
  }

  # if we have a db master host, turn on hot standby
  if $wal_e::master {
    $standby_mode = "standby_mode = 'on'\nprimary_conninfo = 'host=${wal_e::master} port=5432'\ntrigger_file = '/var/lib/postgresql/9.2/tmp/pg_failover_trigger'\n"
    concat::fragment { 'standby_mode':
      target  => $recovery,
      content => $standby_mode,
      order   => '05',
    }
  }

  # fetch WAL files from S3
  concat::fragment { 'restore_command':
    target  => $recovery,
    content => "restore_command = 'envdir ${wal_e::rootdir}/env /usr/local/bin/wal-e wal-fetch %f %p'\n",
    order   => '25',
  }
}
