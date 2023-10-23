# frozen_string_literal: true

module Fusion
  class Engine < ::Rails::Engine
    isolate_namespace Fusion

    config.to_prepare do
      %w[user.rb offer.rb].each do |file|
        require_dependency(Fusion::Engine.root.join('lib/fusion/decorators', file))
      end
    end

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_bot
      g.factory_bot dir: 'spec/factories'
    end
  end
end
