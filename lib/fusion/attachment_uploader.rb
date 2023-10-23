# frozen_string_literal: true

module Fusion
  class AttachmentUploader < CarrierWave::Uploader::Base
    storage :file
  end
end
