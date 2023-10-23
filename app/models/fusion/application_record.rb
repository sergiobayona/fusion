# frozen_string_literal: true

module Fusion
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true
  end
end
