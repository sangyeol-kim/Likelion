class CreateGoods < ActiveRecord::Migration[5.1]
  def change
    create_table :goods do |t|
      t.belongs_to :user
      t.belongs_to :post
      t.timestamps
    end
  end
end
