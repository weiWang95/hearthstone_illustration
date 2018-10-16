module FormHelper
  def custom_form_error(form, column)
    return unless form.object.errors.key?(column.to_sym)

    content_tag(:div, form.object.errors[:icon].join(','), class: 'error-message text-danger')
  end
end