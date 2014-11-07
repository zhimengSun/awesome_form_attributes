module UsedAttrColumns

  extend ActiveSupport::Concern

  module ClassMethods
  
  end

  def used_attrs
    I18n.t(self.class.default_local_path).try(:keys) || []
  end

  def short_used_attrs
    base_clos = I18n.t(self.class.displayed_columns_local_path).try(:keys) || used_attrs[0, 5] 
  end
end
