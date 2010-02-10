module Soop
  class Mixer
    def self.mix_target target, configuration
      configuration.mixin_modules_for(target).each do |mixin_module|
        mixin = mixin_module.const_get target.name.split('::')[-1]
        target.send(:include, mixin)   
      end
    end 
    
    def self.mix! configuration
      configuration.target_modules.each do |target_module|
        target_module.constants.each do |constant_name|
          target = target_module.const_get constant_name
          mix_target target, configuration
        end
      end
    end
  end
end