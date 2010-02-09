require 'rubygems'
require 'spec'
require File.join(File.dirname(__FILE__), '..', 'lib', 'soop')

ActiveSupport::Dependencies.load_paths << File.join(File.dirname(__FILE__), 'support')
plugin_spec_dir = File.dirname(__FILE__)


