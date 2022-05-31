class RenameOccurenceType < ActiveRecord::Migration[6.1]
  def change
    rename_column :historics, :occurence_type, :occurrence_type
    remove_column :wallets, :amount
    remove_column :wallets, :amount_cents
  end
end
