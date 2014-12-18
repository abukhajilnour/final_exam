class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|
      t.integer :bid
      t.references :auction, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
