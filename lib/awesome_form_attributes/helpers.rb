module ActionView 
  module Helpers
    def boolean_collection
      [["是", 1], ["否", 0]]
    end

    def klass
      controller_name.classify.constantize
    end

    def localize_attr(sym, opts = {})
      displayed_name = I18n.t("#{klass.displayed_columns_local_path}.#{sym.to_s}")
      basic_name = I18n.t("#{klass.default_local_path}.#{sym.to_s}")
      return displayed_name || basic_name if opts[:display] == true
      basic_name
    end
  end
end
