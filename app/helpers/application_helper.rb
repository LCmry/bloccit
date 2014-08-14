module ApplicationHelper
#  def form_group_tag(errors, &block)
#    if errors.any?
#      content_tag :div, capture(&block), class: 'form-group has-error'
#    else
#      content_tag :div, capture(&block), class: 'form-group'
#    end
#  end
  def form_group_tag(errors)
    if errors.any?
      "class='form-group has-error'"
    else
      "class='form-group'"
    end
  end
end
