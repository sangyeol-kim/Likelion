class CreateLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :links do |t|
      t.string :title
      t.string :url
      
      # 블라인드 Stack
      t.integer :num
      
      t.string :user_name
      t.text :description
      t.text :description_permission

      t.timestamps
    end
  end
end
