module Soop
  
  class ActiveSupportHook
    def self.activate!
      ActiveSupport::Dependencies.send(:include, LoadHook)
    end
  end

  module LoadHook
    def self.included(clazz)
      clazz.class_eval do
        unless defined? load_missing_constant_without_mix
          alias_method_chain :load_missing_constant, :mix
        end
      end
    end

    def load_missing_constant_with_mix(from_mod, const_name)
      target = load_missing_constant_without_mix(from_mod, const_name)
      Soop::Mixer.mix_target target, Soop::Configuration.singleton
      target
    end
  end
end