# frozen_string_literal: true

module Fusion
  class Configuration
    attr_writer :company_model, :address_model, :offer_model, :user_model, :owner_model, :document_model

    def company_model
      (@company_model || 'User').to_s.constantize
    end

    def address_model
      (@address_model || 'Address').to_s.constantize
    end

    def offer_model
      (@offer_model || 'Offer').to_s.constantize
    end

    def user_model
      (@user_model || 'User').to_s.constantize
    end

    def owner_model
      (@owner_model || 'User').to_s.constantize
    end

    def attachment_model
      (@attachment_model || 'Attachment').to_s.constantize
    end
  end

  # @return [Fusion::Configuration] Fusion's current configuration
  def self.configuration
    @configuration ||= Configuration.new
  end

  # Set Fusion's configuration
  # @param config [Fusion::Configuration]
  def self.configuration=(config)
    @configuration = config
  end

  # Modify Fusion's current configuration
  # @yieldparam [Fusion::Configuration] config current Fusion config

  def self.configure
    yield configuration
  end
end
