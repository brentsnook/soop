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
    Core::Cat.new.should respond_to :added_method  
  end
  
  it "can mix classes as they're loaded by ActiveSupport"
  
end