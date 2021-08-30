# frozen_string_literal: true

require_relative 'has_state/inclusions/base'
require_relative 'has_state/inclusions/class_methods'

module HasState
  include Inclusions::Base

  def self.included(base)
    base.extend Inclusions::ClassMethods
  end
end
