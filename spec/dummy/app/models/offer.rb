# frozen_string_literal: true

class Offer < ApplicationRecord
  belongs_to :user
  has_many :owners, through: :user
  has_many :attachments, as: :object, dependent: :destroy

  def renewable?
    eligible_for_renewal
  end
end
