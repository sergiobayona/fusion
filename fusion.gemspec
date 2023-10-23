# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

require 'fusion/version'

Gem::Specification.new do |spec|
  spec.name        = 'fusion'
  spec.version     = Fusion::VERSION
  spec.required_ruby_version = '>= 2.5'
  spec.authors     = ['Sergio Bayona']
  spec.email       = ['bayona.sergio@gmail.com']
  spec.homepage    = 'https://bitbucket.org/ioucentral/fusion'
  spec.summary     = 'Loan application submission processing engine'
  spec.description = 'Mountable Rails engine for processing new loan applications'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = ''
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = Dir['{app,config,db,lib}/**/*', 'Rakefile', 'README.md']

  spec.add_dependency 'carrierwave'
  spec.add_dependency 'jbuilder'
  spec.add_dependency 'mysql2'
  spec.add_dependency 'rails', '~> 5.2'
  spec.add_development_dependency 'factory_bot_rails'
  spec.add_development_dependency 'pry-stack_explorer'
  spec.add_development_dependency 'rspec-activemodel-mocks'
  spec.add_development_dependency 'rspec-json_expectations'
  spec.add_development_dependency 'rspec-rails'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-performance'
  spec.add_development_dependency 'rubocop-rails'
  spec.add_development_dependency 'rubocop-rspec'
end
