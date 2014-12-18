class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.string :title
      t.text :details
      t.integer :reserve_price
      t.date :ending_date
      t.references :user, index: true

      t.timestamps
    end
  end
end
