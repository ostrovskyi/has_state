require_relative "#{GEM_ROOT_DIR}/lib/has_state/inclusions/base"

RSpec.describe HasState::Inclusions::Base do
    describe '#state' do
        class TestDeclaration
            include HasState::Inclusions::Base
        end

        subject { TestDeclaration.new.state }

        it { is_expected.to eq('initial') }
    end
end