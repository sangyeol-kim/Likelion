source 'https://rubygems.org'
gem 'devise', git:'https://github.com/plataformatec/devise.git'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Gem : 회원관리 (17.06.28) 상열
gem 'cancancan'
gem 'rolify'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.0'
# Use sqlite3 as the database for Active Record, 헤로쿠
gem 'sqlite3', :group => :development
gem 'pg', '~> 0.21.0', :group => :production
gem 'rails_12factor', :group => :production
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13.0'
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Gem : 목록 페이징 기능 (17.5.23 추가,17.8.3 will_paginate => kaminari로 변경)
# gem 'will_paginate', '~> 3.0'
gem 'kaminari'

# Gem : 게시판 에디터 (TinyMCE) (17.5.24 추가)
gem 'tinymce-rails'

# Gem : 게시판 에디터 (TinyMCE) + 이미지 업로드 기능 추가 (17.6.24 추가)
# 참고(AWS S3 설정법) : http://blog.naver.com/kbs4674/221038301355
# 참고(TinyMCE와 AWS S3 연동) : http://blog.naver.com/kbs4674/221039105137
gem 'tinymce-rails-imageupload', '~> 4.0.0.beta'
gem 'carrierwave'
gem 'mini_magick'
gem 'fog'

# Gem : devise 한글화 (17.6.30 추가)
gem 'devise-i18n'

# Gem : DB 더욱 보기 쉽게 (17.7.1 추가)
#gem 'rails_db'

# Gem : impressionist(조회수 기능 등 구현을 쉽게) (17.7.1 추가)
gem 'impressionist'

# Gem : paranoia (실제로 DB 삭제 안되고 숨김-soft delete) (17.07.05 추가) / 실제 삭제 안된건 rails/db 확인하면 delete_at 찍혀있음
gem 'paranoia', '~> 2.0'

# Gem : 부트스트랩 관련 (17.7.28)
gem 'jquery-rails'
gem 'bootstrap', '~> 4.0.0.alpha6'
gem 'sprockets-rails', :require => 'sprockets/railtie'

# Gem : 알림을 위한 메시지 잼
gem 'unread'

# Gem : 액션케이블을 위한 redis Gem (17.8.14)
gem 'redis'
gem 'sidekiq'

# Gem : 투표 (17.8.16)
gem 'acts_as_votable', '~> 0.10.0'
gem 'record_tag_helper', '~> 1.0'

# Gem : 검색엔진 - elasticsearch (17.8.16)
gem 'elasticsearch', git: 'git://github.com/elasticsearch/elasticsearch-ruby.git'
gem 'elasticsearch-model', git: 'git://github.com/elasticsearch/elasticsearch-rails.git'
gem 'elasticsearch-rails', git: 'git://github.com/elasticsearch/elasticsearch-rails.git'
gem 'bonsai-elasticsearch-rails', group: :production # for Bonsai plugin on heroku

# Gem : 피가로
gem 'figaro'