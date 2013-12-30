# puppet-wal_e

[![Build Status](https://travis-ci.org/justindowning/puppet-wal_e.png)](https://travis-ci.org/justindowning/puppet-wal_e)

## Description

This Puppet module will install and manage [wal-e](https://github.com/wal-e/wal-e) for PostgreSQL.

## Usage

**This module is still being fleshed out and has only been tested with Ubuntu. It is also opinionated in that it expects PostgreSQL to be installed on the host machine.**

If you are using the Puppet Labs PostgreSQL module, you can configure WAL-E as such:

    class { 'postgresql::server': }->
    class { 'wal_e':
      access_key => 'foo',
      secret_key => 'bar',
      s3_prefix  => 's3://bucket/folder',
    }

## Testing

Like the module, the `Vagrantfile` is opinionated. You will need to pass a `PUPPET_HOME` variable with the directory to the following Puppet modules:
    * apt
    * concat
    * firewall
    * postgresql
    * stdlib

For example, `PUPPET_HOME=~/path/to/puppet vagrant up` will start a Ubuntu box and setup WAL-E.
