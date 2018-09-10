module ApplicationHelper
  def body_class
    format('%s-%s-page', controller_path.tr('/_', '-'), action_name)
  end
end
