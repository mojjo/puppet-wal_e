# == Class: wal_e::deps
class wal_e::deps {
  if ! defined(Package['daemontools']) {
    package { 'daemontools': ensure => installed }
  }

  if ! defined(Package['lzop']) {
    package { 'lzop': ensure => installed }
  }

  if ! defined(Package['libevent-dev']) {
    package { 'libevent-dev': ensure => installed }
  }

  if ! defined(Package['pv']) {
    package { 'pv': ensure => installed }
  }

  if ! defined(Package['python-pip']) {
    package { 'python-pip': ensure => installed }
  }

  if ! defined(Package['python-gevent']) {
    package { 'python-gevent': ensure => installed }
  }
}
