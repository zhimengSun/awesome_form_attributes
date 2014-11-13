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

    def table_th_columns(wrapper = :td, style = {})
      join_content(wrapper, style) {|a| localize_attr(a)}
    end

    def values_for_columns(obj, wrapper = :td, style = {})
      join_content(wrapper, style) {|a| obj.send(a)}
    end

    def join_content(wrapper = :td, style = {}, &lamb)
      content = klass.displayed_columns.map do |a|
        content_tag(wrapper, lamb.call(a), style)
      end.join
      raw content
    end
  end
end
