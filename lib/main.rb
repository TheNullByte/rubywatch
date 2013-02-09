#! /usr/bin/ruby
Dir[File.dirname(__FILE__)+'/modules/*.rb'].each{|file| require file}

include Config

#Defaults


vars = get_vars(File.join(File.dirname(__FILE__),'config/rubywatch.conf'))

logFile = vars['LogFile']

#IIS.parseFile(logFile)