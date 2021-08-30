# frozen_string_literal: true

require 'has_state'

class Vehicle
  include HasState

  has_state
end

RSpec.describe Vehicle do
  subject { described_class.new }

  describe '#state' do
    it do
      is_expected.to respond_to(:state)
      expect(subject.state).to eq('initial')
    end
  end
end
