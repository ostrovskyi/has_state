require_relative "#{GEM_ROOT_DIR}/lib/has_state/inclusions/class_methods"

RSpec.describe HasState::Inclusions::ClassMethods do
    describe '.has_state' do
        subject { -> {
            class TestDeclaration
                extend HasState::Inclusions::ClassMethods

                has_state
            end
        } }

        it { is_expected.not_to raise_error }
    end
end