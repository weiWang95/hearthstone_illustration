module CrumbHelper
  extend ActiveSupport::Concern

  def add_crumb(name, url = '')
    @_crumbs ||= []
    @_crumbs << { name: name, url: url }
  end
end