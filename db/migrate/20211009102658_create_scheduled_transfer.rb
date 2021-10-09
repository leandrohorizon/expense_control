class CreateScheduledTransfer < ActiveRecord::Migration[6.1]
  def change
    create_table :scheduled_transfers do |t|
      t.string  :description
      t.integer :amount_cents
      t.integer :occurrence_type

      t.integer :frequency
      t.date :scheduled_date
      t.integer :quantity

      t.timestamps
    end
  end
end
