class Admin::CardsController < Admin::BaseController
  before_action :load_crumb

  def index
    cards  = Card.all
    @count = cards.count
    @cards = cards.includes(:profession).page(params[:page])
  end

  private

  def load_crumb
    add_crumb('卡牌管理', admin_cards_path)
  end
end
