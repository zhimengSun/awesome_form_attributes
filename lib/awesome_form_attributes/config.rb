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
    config.default_tag = "input"
    config.text_area_words = %w(描述 简介 介绍)
    config.select_words = %w(优先级)
    config.boolean_words = %w(是否)
    config.file_words = %w(文件)
    config.text_area_reg = /#{config.text_area_words.join("/")}/ 
    config.select_reg = /#{config.select_words.join("/")}/ 
    config.boolean_reg = /#{config.boolean_words.join("/")}/ 
    config.file_reg = /#{config.file_words.join("/")}/ 
  end
end

