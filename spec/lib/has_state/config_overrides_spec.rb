# frozen_string_literal: true

require_relative "#{GEM_ROOT_DIR}/lib/has_state/config_overrides"

RSpec.describe HasState::ConfigOverrides do
  describe 'DEFAULT_KEYS' do
    subject { described_class::DEFAULT_KEYS }

    it do
      is_expected.to include(:default_value)
    end
  end

  describe '#initialize' do
    let(:initial_state) { :queued }
    let(:params) { { default_value: initial_state } }

    subject { described_class.new(params) }

    it do
      expect { subject }.not_to raise_error
      is_expected.to be_kind_of(described_class)
    end

    it 'is appending given overrides' do
      expect(subject.to_hash[:default_value]).to eq(initial_state)
    end

    context 'when parameters is not given' do
      subject { described_class.new }

      it do
        expect { subject }.not_to raise_error
        is_expected.to be_kind_of(described_class)
      end
    end

    context 'when parameter is not a hash' do
      let(:params) { [:default_value] }

      it { expect { subject }.to raise_error(ArgumentError) }
    end
  end

  describe '#append' do
    let(:appending_key) { :default_value }
    let(:appending_value) { :pending }
    let(:described_class_object) { described_class.new }

    subject { described_class_object.append(appending_key, appending_value) }

    it { is_expected.to be_truthy }
    it 'added new value' do
      subject
      expect(described_class_object.to_hash[appending_key]).to eq(appending_value)
    end

    context 'when appending key is not available' do
      let(:appending_key) { :unknown }

      it { expect { subject }.to raise_error(ArgumentError) }
    end
  end

  describe '#to_hash' do
    let(:initial_state) { :pending }
    let(:params) { { default_value: initial_state } }
    let(:described_class_object) { described_class.new(params) }

    subject { described_class_object.to_hash }

    it do
      is_expected.to be_kind_of(Hash)
      is_expected.to eq({ default_value: initial_state })
    end

    context 'when value is not overriden' do
      let(:params) { {} }

      it { expect(subject.keys).not_to include(:default_value) }
    end
  end
end
