module ImageHelper
  def small_image_tag(source, **opts)
    cl_image_tag(source, opts.merge(html_size: '40x40', crop: :fill))
  end

  def resize_image_tag(source, **opts)
    cl_image_tag(source, opts.merge(crop: :fill))
  end
end