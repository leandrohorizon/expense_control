class FixColumnAmountCents < ActiveRecord::Migration[6.1]
  def change
    rename_column :historics, :amount_cents, :amount
    rename_column :scheduled_transfers, :amount_cents, :amount
    rename_column :wallets, :amount_cents, :amount
  end
end
