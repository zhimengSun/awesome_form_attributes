module UsedAttrColumns

  extend ActiveSupport::Concern

  module ClassMethods
  end
  
  def used_attrs
    I18n.t("activerecord.attributes.#{self.class.table_name.singularize}").keys
  end

  def short_used_attrs
    []
  end
end
