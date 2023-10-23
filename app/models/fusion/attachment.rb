# frozen_string_literal: true

module Fusion
  class Attachment < ApplicationRecord
    belongs_to :offer, class_name: 'Fusion::Offer', optional: true

    validates :file_type, presence: true

    mount_uploader :file, Fusion::AttachmentUploader

    delegate :broker_id, to: :offer
  end
end
