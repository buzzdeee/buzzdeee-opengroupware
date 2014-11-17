require 'spec_helper'
describe 'opengroupware' do

  context 'with defaults for all parameters' do
    it { should contain_class('opengroupware') }
  end
end
