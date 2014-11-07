module UsedAttrColumns

  extend ActiveSupport::Concern

  module ClassMethods
  end
  
  def used_attrs
    I18n.t("activerecord.attributes.#{self.class.table_name.singularize}").try(:keys) || []
  end

  def short_used_attrs
    used_attrs[0, 5]
  end
end
