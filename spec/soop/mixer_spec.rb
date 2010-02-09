require File.dirname(__FILE__) + '/../spec_helper'

describe Soop::Mixer do
  describe 'mixing a single target' do
    it 'applies all corresponding mixins for a target'
    it 'ignores mixins that are not a module'
    it "doesn't try to apply a mixin that doesn't exist"
  end
  
  describe 'mixing all targets' do
    it 'applies mixins to all discovered targets within all target modules'
    it 'only applies mixins to targets that are modules (or classes)'
  end
end