# frozen_string_literal: true

require_relative "#{GEM_ROOT_DIR}/lib/has_state/inclusions/class_methods"

RSpec.describe HasState::Inclusions::ClassMethods do
  describe '.has_state' do
    subject do
      lambda do
        class TestDeclaration
          extend HasState::Inclusions::ClassMethods

          has_state do
            1 + 1
          end
        end
      end
    end

    it { is_expected.not_to raise_error }

    context 'when block is not passed' do
      subject do
        lambda do
          class TestDeclaration
            extend HasState::Inclusions::ClassMethods
            has_state
          end
        end
      end

      it { is_expected.not_to raise_error }
    end
  end
end
