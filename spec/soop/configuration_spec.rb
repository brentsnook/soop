require File.dirname(__FILE__) + '/../spec_helper'

describe Soop::Configuration do

  before do
    @config = Soop::Configuration.new
    @target_module = mock('target module', :is_a? => true)
  end
  
  it 'ignores target modules with no mixin module specified' do
    @config.add @target_module, {}
    
    @config.target_modules.should be_empty  
  end
  
  it "ignores target modules that aren't modules" do
    NotAModule = ''
    
    @config.add NotAModule, :with => [mock('mixin module')] 
    
    @config.target_modules.should be_empty   
  end
  
  it 'allows a single mixin module to be supplied' do
    mixin_module = mock('mixin module')
    clazz = mock('class', :parent => @target_module)
    
    @config.add @target_module, :with => mixin_module
    
    @config.mixin_modules_for(clazz).should == [mixin_module]
  end
  
  it 'returns all target modules' do
    second_target = mock('second target', :is_a? => true)
    @config.add @target_module, :with => mock('target module')
    @config.add second_target, :with => mock('target module')
    
    @config.target_modules.should include(@target_module, second_target)
  end
  
  it 'finds the mixin modules for a target' do
    first_mixin_module = mock('first mixin module') 
    second_mixin_module = mock('second mixin module')
    clazz = mock('class', :parent => @target_module)
    
    @config.add @target_module, :with => [first_mixin_module, second_mixin_module]
    
    @config.mixin_modules_for(clazz).should include(first_mixin_module, second_mixin_module)
  end
  
  it 'returns an empty list when there are no mixin modules for a target' do
    @config.mixin_modules_for(String).should be_empty
  end
 
end