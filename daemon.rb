#!/usr/bin/env ruby
require 'rubygems'
require 'wonga/daemons'
require_relative 'pantry_ad_domain_join_event_handler/pantry_ad_domain_join_event_handler'

config_name = File.join(File.dirname(File.symlink?(__FILE__) ? File.readlink(__FILE__) : __FILE__), "config", "daemon.yml")
Wonga::Daemon.load_config(File.expand_path(config_name))
Wonga::Daemon.run(Wonga::Daemon::<&= daemon_name.split("_").each{|s| s.capitalize!}.join("") =%>.new(Wonga::Daemon.publisher,Wonga::Daemon.logger))
