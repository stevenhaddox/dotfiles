#!/usr/bin/env ruby
# wol.rb: sends out a magic packet to wake up your PC
#
# Copyright (c) 2004 zunda <zunda at freeshell.org>
#
# This program is free software. You can re-distribute and/or
# modify this program under the same terms of ruby itself ---
# Ruby Distribution License or GNU General Public License.
#

# target machine
mac = ENV['MAC_ADDRESS'] || 'XX:XX:XX:XX:XX:XX' # hex numbers

# target network
host = '10.0.1.X'
local = true
# host = 'example.com'
# local = false

require 'socket'
port = 9  # Discard Protocol
message = "\xFF"*6 + [ mac.gsub( /:/, '' ) ].pack( 'H12' )*16
txbytes = UDPSocket.open do |so|
  if local then
    so.setsockopt( Socket::SOL_SOCKET, Socket::SO_BROADCAST, true )
  end
  so.send( message, 0, host, port )
end
puts "#{txbytes} bytes sent to #{host}:#{port}."
