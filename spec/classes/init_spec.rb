require 'spec_helper'
describe 'monyog' do

  context 'with defaults for all parameters' do
    it { should contain_class('monyog') }
  end
end
