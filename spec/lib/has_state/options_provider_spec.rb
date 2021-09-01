# frozen_string_literal: true

require_relative "#{GEM_ROOT_DIR}/lib/has_state/options_provider"
require_relative "#{GEM_ROOT_DIR}/lib/has_state/config_overrides"

RSpec.describe HasState::OptionsProvider do
  describe 'DEFAULT_OPTIONS' do
    subject { described_class::DEFAULT_OPTIONS }

    it { is_expected.to include(default_value: :initial) }
  end

  describe '#initialize' do
    let(:param) { HasState::ConfigOverrides.new }

    subject { described_class.new(param) }

    it { is_expected.to be_kind_of(described_class) }

    context 'when param is not a config overrides' do
      let(:param) { { example: :hash } }

      it { expect { subject }.to raise_error(ArgumentError) }
    end
  end

  describe '#options' do
    let(:param) { HasState::ConfigOverrides.new }
    let(:described_class_object) { described_class.new(param) }

    subject { described_class_object.options }

    it do
      is_expected.to be_kind_of(Hash)
      is_expected.to include(default_value: :initial)
    end

    context 'when value have been overwritten' do
      let(:value_to_override) { :pending }
      let(:param) { HasState::ConfigOverrides.new(default_value: value_to_override) }

      it { is_expected.to include(default_value: value_to_override) }
    end
  end
end
