class CreateBuyPrefectures < ActiveRecord::Migration[6.1]
  def change
    create_table :buy_prefectures do |t|
       t.string :name, null: false, default: ""
      t.timestamps
    end
  end
end
