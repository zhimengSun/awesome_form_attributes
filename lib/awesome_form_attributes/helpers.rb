module ActionView 
  module Helpers
    def boolean_collection
      [["是", 1], ["否", 0]]
    end

    def localize_attr(sym, otps = {})
      I18n.t("activerecord.attributes.#{controller_name.singularize}.#{sym.to_s}")
    end
  end
end
