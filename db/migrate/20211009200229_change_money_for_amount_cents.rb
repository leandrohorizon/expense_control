class ChangeMoneyForAmountCents < ActiveRecord::Migration[6.1]
  def change
    change_table :historics do |t|
      t.money :amount
    end

    change_table :scheduled_transfers do |t|
      t.money :amount
    end

    change_table :wallets do |t|
      t.money :amount
    end
  end
end
