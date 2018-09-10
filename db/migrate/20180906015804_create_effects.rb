class CreateEffects < ActiveRecord::Migration[5.2]
  def change
    create_table :effects do |t|
      t.string :name, comment: '名称'
      t.string :description, comment: '描述'
      t.string :match, comment: '用于匹配效果'

      t.datetime :deleted_at, comment: '删除时间'
      t.timestamps
    end
  end
end
