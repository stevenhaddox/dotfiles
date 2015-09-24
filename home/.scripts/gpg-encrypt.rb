#!/usr/bin/env ruby
require 'rgpg'

file = ARGV[0]
gpg_dir = "#{ENV['HOME']}/.gnupg"
Rgpg::GpgHelper.encrypt_file "#{gpg_dir}/stevenhaddox.pub", file, "#{file}.enc"
