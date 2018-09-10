class CreateProfessions < ActiveRecord::Migration[5.2]
  def change
    create_table :professions do |t|
      t.string :name, comment: '名称'
      t.string :icon, comment: '图标'
      t.string :skill, comment: '技能'

      t.timestamps
    end
  end
end
