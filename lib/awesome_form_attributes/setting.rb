class << ActiveRecord::Base
  def awesome_form_attributs(opts = {})
  end
end

class ActiveRecord::Base
  class << self
    def oname
      self.table_name.singularize
    end
 
    def default_local_path(singname = oname)
      "activerecord.attributes.#{singname}"
    end

    def displayed_columns_local_path(singname = oname)
      "awesome_form_attributes.displayed_columns.#{singname}"
    end
  end
end


