require 'spec_helper'

describe 'wal_e', :type => 'class' do
  let(:facts) do
    {
      :osfamily => 'Debian',
      :concat_basedir => '/tmp'
    }
  end

  it { should contain_class('wal_e::deps') }
  it { should contain_class('wal_e::slave') }

  it do  should contain_package('wal-e').with(
    'name'     => 'git+https://github.com/wal-e/wal-e',
    'provider' => 'pip',
  ) end


  [ '/etc/wal-e.d', '/etc/wal-e.d/env' ].each do |dir|
    describe "creates #{dir}" do
      it { should contain_file(dir).with({
          'ensure'  => 'directory',
          'owner'   => 'root',
          'group'   => 'postgres',
          'mode'    => '0750',
        })
      }
    end
  end

  [
    '/etc/wal-e.d/env/AWS_ACCESS_KEY_ID',
    '/etc/wal-e.d/env/AWS_SECRET_ACCESS_KEY',
    '/etc/wal-e.d/env/WALE_S3_PREFIX'
  ].each do |file|
    describe "creates #{file}" do
      it { should contain_file(file).with({
          'ensure'  => 'file',
          'owner'   => 'root',
          'group'   => 'postgres',
          'mode'    => '0640',
        })
      }
    end
  end

end
