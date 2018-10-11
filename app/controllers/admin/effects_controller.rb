class Admin::EffectsController < Admin::BaseController
  before_action :load_crumb

  def index
  end

  private

  def load_crumb
    add_crumb('效果管理', admin_effects_path)
  end
end
