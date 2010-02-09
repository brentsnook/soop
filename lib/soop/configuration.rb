module Soop
  class Configuration
    
    def initialize
      @targets = {}
    end
    
    def self.method_missing method, *args, &block
      singleton.send method, *args, &block  
    end
     
    def add target_module, mixin_modules
      @targets[target_module] = mixin_modules
    end
    
    def target_modules
      @targets.keys
    end
    
    def mixin_modules_for target
      @targets[target.parent] || []
    end
    
    def has_mixins? target
      mixin_modules_for(target).size > 0
    end
    
    private
    
    def self.singleton
      @singleton = Configuration.new unless defined? @singleton
      @singleton 
    end 
  end
end