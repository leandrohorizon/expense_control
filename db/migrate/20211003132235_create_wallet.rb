class CreateWallet < ActiveRecord::Migration[6.1]
  def change
    create_table :wallets do |t|
      t.string :source
      t.integer :amount_cents

      t.timestamps
    end
  end
end
