# frozen_string_literal: true

class Attachment < ApplicationRecord
  belongs_to :user
  belongs_to :creator, class_name: 'User', foreign_key: :uploaded_by
  belongs_to :object, polymorphic: true, touch: true
end
