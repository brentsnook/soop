require File.dirname(__FILE__) + '/spec_helper'

describe Soop do
  
  it 'can mix classes immediately' do
    
    module Core
      class Cat;end
    end
    
    module Presentation
      module Cat
        def added_method; end  
      end
    end
    
    Soop.mix Core, :with => [Presentation]
    Soop.mix!
    
    Core::Cat.new.should respond_to(:added_method)  
  end
  
  it "can mix classes as they're loaded by ActiveSupport" do
    Soop.mix_on_active_support_load!
    Soop.mix UnloadedCore, :with => [UnloadedPresentation]
  
    UnloadedCore::Cat.new.should respond_to(:added_method)
  end
  
end