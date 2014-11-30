require 'active_support/configurable'

module AwesomeFormAttributes
  def self.configure(&block)
    yield @config ||= AwesomeFormAttributes::Configuration.new
  end

  def self.config
    @config
  end

  class Configuration 
    include ActiveSupport::Configurable
    config_accessor :default_tag
    config_accessor :text_area_words 
    config_accessor :select_words
    config_accessor :boolean_words
    config_accessor :file_words 
    config_accessor :text_area_reg 
    config_accessor :select_reg
    config_accessor :boolean_reg
    config_accessor :file_reg 

    def param_name
      config.param_name.respond_to?(:call) ? config.param_name.call : config.param_name
    end

    writer, line = 'def param_name=(value); config.param_name = value; end', __LINE__
    singleton_class.class_eval writer, __FILE__, line
    class_eval writer, __FILE__, line
  end

  configure do |config|
    config.default_tag = "text_field"
    config.text_area_words = %w(描述 简介 介绍)
    config.select_words = %w(select 类型)
    config.boolean_words = %w(是否)
    config.file_words = %w(文件)
    class << config
      %w(text_area select boolean file).each do |c|
        define_method(:"#{c}_reg") do
         /#{config.send(:"#{c}_words").join("|")}/
        end
      end 
    end
  end
end

