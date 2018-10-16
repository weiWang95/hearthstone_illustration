module ApplicationHelper
  def body_class
    format('%s-%s-page', controller_path.tr('/_', '-'), action_name)
  end

  def render_list(**opts)
    if opts[:collection].blank?
      render('shared/empty', opts[:message])
    else
      render(**opts)
    end
  end

  def render_paginate(records, **opts)
    render('shared/paginate', records: records || [], opts: opts)
  end
end
