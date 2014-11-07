require "rails"
require "awesome_form_attributes/version"
require "awesome_form_attributes/setting"
require "awesome_form_attributes/helpers"
require "awesome_form_attributes/used_attr_columns"

ActiveRecord::Base.send :include, UsedAttrColumns
