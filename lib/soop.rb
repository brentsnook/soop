require 'active_support'

[
  'configuration'
].each {|file| require "soop/#{file}"}

module Soop
  
  VERSION = '0.0.0'
  
  def self.mix target_module, options
    mixin_modules = options[:with]
    Configuration.add target_module, mixin_modules
  end
  
  def self.mix!
    Configuration.target_modules.each do |target_module|
      target_module.constants.each do |constant_name|
        target = target_module.const_get constant_name
        mix_target target
      end
    end
  end
  
  def self.mix_target target
    Configuration.mixin_modules_for(target).each do |mixin_module|
      mixin = mixin_module.const_get target.name.split('::')[-1]
      target.send(:include, mixin)   
    end
  end
  
  def self.mix_on_active_support_load!
    ActiveSupport::Dependencies.send(:include, LoadHooks)
  end
  
  module LoadHooks
    def self.included(clazz)
      clazz.class_eval do
        unless defined? load_missing_constant_without_mix
          alias_method_chain :load_missing_constant, :mix
        end
      end
    end

    def load_missing_constant_with_mix(from_mod, const_name)
      target = load_missing_constant_without_mix(from_mod, const_name)
      Soop::mix_target target
      target
    end
  end
  
end

