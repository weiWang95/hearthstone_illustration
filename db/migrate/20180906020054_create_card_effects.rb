class CreateCardEffects < ActiveRecord::Migration[5.2]
  def change
    create_table :card_effects do |t|
      t.references :card, foreign_key: true, comment: '卡牌'
      t.references :effect, foreign_key: true, comment: '效果'

      t.datetime :deleted_at, comment: '删除时间'
      t.timestamps
    end
  end
end
