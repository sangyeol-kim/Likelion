class CreateKnus < ActiveRecord::Migration[5.1]
  def change
    create_table :knus do |t|
      t.string :key
      t.timestamps
    end
  end
end
