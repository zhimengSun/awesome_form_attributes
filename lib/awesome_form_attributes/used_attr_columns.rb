# -*- encoding : utf-8 -*-
module UsedAttrColumns

  extend ActiveSupport::Concern

  module ClassMethods
    def used_attrs
      I18n.t(self.default_local_path).try(:keys) || []
    end

    def select_options
      {} 
    end
  
    def select_values(tag, obj = nil)
      select_options[tag] || select_options[tag.to_s] || []
    end

    def short_used_attrs
      I18n.t(self.displayed_columns_local_path).try(:keys) || used_attrs[0, 5] 
    end
    alias :displayed_columns :short_used_attrs
  end
end
