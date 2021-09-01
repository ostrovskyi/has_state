# frozen_string_literal: true

require 'has_state'

RSpec.describe 'module integration' do
  describe 'without any params' do
    class Championship
      include HasState

      has_state
    end

    subject { Championship.new }

    describe '#state' do
      it do
        is_expected.to respond_to(:state)
        expect(subject.state).to eq(:initial)
      end
    end
  end

  describe 'specifying custom initial value' do
    class ChampionshipCustomValue
      include HasState

      has_state default: :group_phase
    end

    subject { ChampionshipCustomValue.new.state }

    describe '#state' do
      it { is_expected.to eq(:group_phase) }
    end
  end
end
