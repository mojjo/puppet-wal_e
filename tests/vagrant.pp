class { 'postgresql::server': }->
class { 'wal_e':
  pgdata     => '/var/lib/postgresql/9.1/main',
  access_key => 'foo',
  secret_key => 'bar',
  s3_prefix  => 's3://bucket/folder',
}
