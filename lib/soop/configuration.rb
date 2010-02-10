module Soop
  class Configuration
    
    def initialize
      @targets = {}
    end
    
    def self.method_missing method, *args, &block
      singleton.send method, *args, &block  
    end
     
    def add target_module, options
      mixin_modules = options[:with]
      mixin_modules = [mixin_modules] if mixin_modules and !mixin_modules.is_a?(Array)
      @targets[target_module] = mixin_modules if mixin_modules and target_module.is_a?(Module)
    end
    
    def target_modules
      @targets.keys
    end
    
    def mixin_modules_for target
      @targets[target.parent] || []
    end

    def self.singleton
      @singleton = Configuration.new unless defined? @singleton
      @singleton 
    end 
  end
end