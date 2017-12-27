class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string   :name
      t.string   :card_id
      t.string   :code
      t.string   :mobile
      t.string   :remark
      t.timestamps
    end
  end
end
