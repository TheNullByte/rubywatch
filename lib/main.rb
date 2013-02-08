#! /usr/bin/ruby
require File.join(File.dirname(__FILE__), 'modules/conf.rb')

include Config

#Defaults


vars = get_vars(File.join(File.dirname(__FILE__),'config/rubywatch.conf'))

logFile = vars['LogFile']