module UsedAttrColumns

  extend ActiveSupport::Concern

  module ClassMethods
    def used_attrs
      I18n.t(self.default_local_path).try(:keys) || []
    end
  
    def select_values(tag)
      []
    end

    def short_used_attrs
      I18n.t(self.displayed_columns_local_path).try(:keys) || used_attrs[0, 5] 
    end
    alias :displayed_columns :short_used_attrs
  end
end
