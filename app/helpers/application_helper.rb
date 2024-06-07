# app/helpers/application_helper.rb
module ApplicationHelper
  def bootstrap_class_for(flash_type)
    case flash_type.to_sym
    when :notice
      'success'   # Bootstrap class for success messages
    when :alert, :error
      'danger'    # Bootstrap class for error messages
    else
      flash_type.to_s
    end
  end
end
