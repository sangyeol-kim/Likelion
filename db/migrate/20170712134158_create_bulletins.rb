class CreateBulletins < ActiveRecord::Migration[5.1]
  def change
    create_table :bulletins do |t|
      t.string :title, comment: "제목"
      t.text :content, comment: "내용"
      
      t.string :user_name
      t.text :description
      t.text :description_permission
      t.integer :user_id

      t.timestamps
    end
  end
end
