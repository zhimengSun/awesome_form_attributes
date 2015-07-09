# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = 'awesome_form_attributes'
  s.version = '1.2.0'
  s.authors = ['Zhimeng Sun']
  s.email = ['zhimengSun@gmail.com']
  s.homepage = 'https://github.com/zhimengSun/awesome_form_attributes'
  s.summary = 'Easy way to write attributes for DB based Object'
  s.description = 'Easy way to write attributes for DB based Object in the VIEWS'

  s.files = `git ls-files`.split("\n")

  s.add_dependency "rails"
end
