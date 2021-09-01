# frozen_string_literal: true

require_relative "#{GEM_ROOT_DIR}/lib/has_state/input_mapper"

RSpec.describe HasState::InputMapper do
  describe '#initialize' do
    let(:input) { [:state, { default: :default }] }

    subject { described_class.new(input) }

    it { is_expected.to be_kind_of(described_class) }

    # context 'when no arguments given' do
    #   subject { described_class.new }

    #   it { is_expected.to be_kind_of(described_class) }
    # end
  end

  describe '#output' do
    let(:initial_state) { :pending }
    let(:input) { { default: initial_state } }
    let(:described_class_object) { described_class.new(input) }

    subject { described_class_object.output }

    it { is_expected.to be_kind_of(Hash) }

    it 'represents default as default_value' do
      expect(subject[:default_value]).to eq(initial_state)
    end

    context 'when default state given as string' do
      let(:initial_state) { 'queued' }

      it 'anyway returns symbol' do
        is_expected.to include(default_value: :queued)
      end
    end

    context 'when default state is not given' do
      let(:input) { {} }

      it 'anyway returns symbol' do
        expect(subject.keys).not_to include(:default_value)
      end
    end
  end
end
