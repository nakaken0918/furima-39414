class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|

      # ActiveHashを用いてオブジェクトを格納。
      t.integer :category_id            , null: false
      t.integer :sales_status_id        , null: false
      t.integer :shipping_fee_status_id , null: false
      t.integer :prefecture_id          , null: false
      t.integer :scheduled_delivery_id  , null: false

      t.timestamps
    end
  end
end
