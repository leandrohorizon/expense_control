class AddScheduledTransferRefToHistorics < ActiveRecord::Migration[6.1]
  def change
    add_reference :historics, :scheduled_transfer, null: true, foreign_key: true
  end
end
