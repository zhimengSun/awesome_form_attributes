module SharedHelper
  def klass
    controller_name.classify.constantize
  end
  
  def obj_str
    controller_name.singularize
  end

  def single_obj
    instance_variable_get("@#{obj_str}")
  end

  def collections
    instance_variable_get("@#{controller_name}")
  end

  def single_obj=(obj)
    instance_variable_set("@#{obj_str}", obj)
  end

  def collections=(objs)
    instance_variable_set("@#{controller_name}", objs)
  end
end
