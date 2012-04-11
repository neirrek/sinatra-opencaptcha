# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)

require 'sinatra/opencaptcha_version'

Gem::Specification.new do |s|
  s.name        = 'sinatra-opencaptcha'
  s.version     = Sinatra::OpenCaptcha::VERSION
  s.authors     = ['Bruno Kerrien']
  s.email       = ['bruno@neirrek.com']
  s.homepage    = 'https://github.com/neirrek/sinatra-opencaptcha'
  s.summary     = 'Sinatra extension for OpenCaptcha'
  s.description = 'A Sinatra module to seamlessly integrate OpenCaptcha to Sinatra applications'

  s.rubyforge_project = 'sinatra-opencaptcha'

  s.add_runtime_dependency 'sinatra', '~> 1.3.2'
  s.add_runtime_dependency 'rest-client', '~> 1.6.7'
  s.add_runtime_dependency 'uuidtools', '~> 2.1.2'

  s.files       = Dir.glob("{bin,lib}/**/*") + %w(LICENSE README.md)
  s.require_paths = ['lib']
end
