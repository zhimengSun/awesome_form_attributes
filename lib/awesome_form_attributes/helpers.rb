# require File.expand_path("../shared_helper",__FILE__)
module ActionView 
  module Helpers
    # ApplicationHelper.send(:include,SharedHelper) if defined?(ApplicationHelper)
    def boolean_collection
      [["是", 1], ["否", 0]]
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

    def table_th_columns(wrapper = :th, style = {})
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
    
    def awesome_fileds(a, f, opts = {})
      cs = AwesomeFormAttributes.config.config
      text_field = cs.delete(:default_tag)
      title = localize_attr(a)
      cur_tag_hash = cs.select {|k, v|  title =~ /#{v.join("|")}/}.presence || {text_field: ""}
      cur_tag = cur_tag_hash.keys.first.to_s.gsub("_words", "")
      opts = default_styles_for(cur_tag, opts)
      return f.send(:check_box, a, opts) if cur_tag == 'boolean'
      obj = f.object
      val = cur_tag == :select ? klass.select_values(tag) : obj.send(a)
      f.send(cur_tag, a, val, opts)
    end
  
    def default_styles_for(tag, opts = {})
      {
        text_area: {rows: 6, cols: 50},
        text_field: {},
        file: {},
        select: {},
        check_box: {},
        boolean: {}
      }[tag.to_sym].deep_merge(opts) rescue opts
    end

  end
end
