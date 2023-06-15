class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|

      # ActiveHashを用いてオブジェクトを格納。
      t.string  :title        , null: false
      t.text    :text         , null: false
      t.integer :category_id  , null: false
      t.integer :condition_id , null: false
      t.integer :delivery_id  , null: false
      t.integer :province_id  , null: false
      t.integer :staet_id     , null: false

      t.timestamps
    end
  end
end
