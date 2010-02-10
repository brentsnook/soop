require 'active_support'

[
  'configuration',
  'mixer',
  'active_support_hook'
].each {|file| require "soop/#{file}"}

module Soop
  
  VERSION = '0.0.0'
  
  def self.mix target_module, options
    Configuration.add target_module, options
  end
  
  def self.mix!
    Mixer.mix! Configuration.singleton
  end
  
end

