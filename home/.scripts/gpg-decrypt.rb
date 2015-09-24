#!/usr/bin/env ruby
require 'rgpg'
require 'io/console'

file = ARGV[0]
gpg_dir = "#{ENV['HOME']}/.gnupg"
print "GPG Key Password: "
password = STDIN.noecho(&:gets).chomp
Rgpg::GpgHelper.decrypt_file "#{gpg_dir}/stevenhaddox.pub", "#{gpg_dir}/stevenhaddox.sec",
                             "#{file}.enc", file, password
