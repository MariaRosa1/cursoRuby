module AdminsBackofficeHelper
  def translate_attributes(object, method)
    object.model.human_attribute_name(method)
  end
end
