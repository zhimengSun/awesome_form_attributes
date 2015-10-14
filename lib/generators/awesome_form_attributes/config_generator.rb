# -*- encoding : utf-8 -*-
module AwesomeFormAttributes
  module Generators
    class ConfigGenerator < Rails::Generators::Base
      source_root File.expand_path(File.join(File.dirname(__FILE__), 'templates'))

      def copy_config_file
        template 'awesome_form_attributes.rb', 'config/initializers/awesome_form_attributes.rb'
      end
    end
  end
end

