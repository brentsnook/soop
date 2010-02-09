require File.dirname(__FILE__) + '/../spec_helper'

describe Soop::Configuration do
  
  it 'is a singleton instance'
  it 'registers mixins for target modules'
  it 'ignores target modules with no mixin module specified'
  it "ignores target modules that aren't modules"
  it 'returns all target modules'
  it 'finds the mixin modules for a target'
  it 'returns an empty list when there are no mixin modules for a target'
 
end