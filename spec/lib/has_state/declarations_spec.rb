# frozen_string_literal: true

require_relative "#{GEM_ROOT_DIR}/lib/has_state/declarations"

RSpec.describe HasState::Declarations do
  class TestDeclaration
    extend HasState::Declarations
  end

  describe 'declare_has_state_reader' do
    let(:options_mock) { double({ options: { field_name: :state } }) }

    subject { TestDeclaration.new }

    it { expect(TestDeclaration).to respond_to(:declare_has_state_reader) }

    it do
      allow(TestDeclaration).to receive(:class_variable_get).and_return(options_mock)
      TestDeclaration.declare_has_state_reader
      is_expected.to respond_to(:state)
    end
  end
end
