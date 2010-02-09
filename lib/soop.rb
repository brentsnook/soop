[
].each {|file| require "soop/#{file}"}

module Soop
  
  VERSION = '0.0.0'
  
  def self.mix target_module, options
    mixin_modules = options[:with]
    target_module.constants.each do |constant_name|
      target = target_module.const_get constant_name
      mixin_modules.each do |mixin_module|
        mixin = mixin_module.const_get target.name.split('::')[-1]
        target.send(:include, mixin)   
      end  
    end
  end
end