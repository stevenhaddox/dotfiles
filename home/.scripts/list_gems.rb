#!/usr/bin/env ruby

require 'rubygems' unless defined? Gem
require 'bundler' # gem install bundler

Bundler.load.specs.map{ |t| t.respond_to?(:value) ? t.value : t }.sort_by(&:name).each { |s| puts "\"#{s.name}\",\"#{s.version}\",\"#{s.licenses.join(",")}\",\"#{s.summary}\",\"#{s.authors.join(",")}\",\"#{s.email}\",\"#{s.homepage}\n" }
