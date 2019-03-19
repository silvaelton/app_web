source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.0'

gem 'rails', '~> 5.2.2'
gem 'support', github: 'codhab/support', branch: 'master'
gem 'pg', '>= 0.18', '< 2.0'

gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '~> 3.2'
gem 'jquery-rails', '~> 4.3.3'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

gem 'bootsnap', '~> 1.1.0', require: false

gem 'haml', '~> 5.0.4'
gem 'simple_form', '~> 4.1.0'
gem 'bcrypt', '~> 3.1.12'

gem 'has_scope', '~> 0.7.2'
gem 'file_validators', '~> 2.3.0'
gem 'validates_cpf_cnpj', '~> 0.2.0'
gem 'validates_timeliness', '~> 4.0.2'
gem 'email_validator', '~> 1.6.0'
gem 'pagy', '~> 1.3.2'
gem 'font-awesome-rails'
gem 'dotenv-rails'
gem 'jquery-fileupload-rails'
gem 'carrierwave', git: 'https://github.com/carrierwaveuploader/carrierwave.git'
gem 'rmagick', '~> 2.16.0'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '~> 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver', '~> 3.141.0'
  gem 'chromedriver-helper', '~> 2.1.0'
end

group :production do
  gem 'unicorn'
  gem 'unicorn-worker-killer'
end

path 'engines' do
  gem 'candidate'
  gem 'entity'
  gem 'external'
end