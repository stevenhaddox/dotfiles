#!/usr/bin/env ruby
require 'rgpg'

Rgpg::GpgHelper.generate_key_pair 'stevenhaddox', 'steven@haddox.us', 'Steven Haddox'
