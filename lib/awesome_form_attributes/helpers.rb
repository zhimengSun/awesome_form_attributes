module ActionView 
  module Helpers
    def boolean_collection
      [["是", 1], ["否", 0]]
    end

    def klass
      controller_name.classify.constantize
    end
    
    def has_displayed_names?
      I18n.t(klass.displayed_columns_local_path).is_a?Hash
    end

    def localize_attr(sym)
      displayed_name = I18n.t("#{klass.displayed_columns_local_path}.#{sym.to_s}")
      basic_name = I18n.t("#{klass.default_local_path}.#{sym.to_s}")
      return displayed_name if has_displayed_names? && !(displayed_name =~ /translation missing/)
      basic_name
    end
  end
end
