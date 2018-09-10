class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.references :profession, foreign_key: true, comment: '所属职业'

      t.string :name, comment: '名称'
      t.string :type, comment: 'STI'
      t.string :quality, comment: '品质'
      t.integer :consumption, comment: '费用'
      t.integer :attack, comment: '攻击力'
      t.integer :hp, comment: '血量/耐久度'

      t.string :cover, comment: ''
      t.string :gold_cover, comment: ''

      t.string :effect_content, comment: '卡牌效果内容'
      t.string :converted_effect_content, comment: '转换后卡牌效果内容'

      t.string :come_dialogue, comment: '出场台词'
      t.string :attack_dialogue, comment: '攻击台词'
      t.string :death_dialogue, comment: '死亡台词'
      t.string :description, comment: '卡牌描述'

      t.datetime :deleted_at, comment: '删除时间'
      t.timestamps
    end
  end
end
