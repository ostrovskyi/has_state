# frozen_string_literal: true

require_relative 'has_state/declarations'
require_relative 'has_state/inclusions/base'
require_relative 'has_state/inclusions/class_methods'
require_relative 'has_state/inclusions/transition'

module HasState
  include Inclusions::Base

  def self.included(base)
    base.extend Declarations

    base.extend Inclusions::ClassMethods

    base.extend Inclusions::Transition
  end
end
