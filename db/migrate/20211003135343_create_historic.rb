class CreateHistoric < ActiveRecord::Migration[6.1]
  def change
    create_table :historics do |t|
      t.string  :description
      t.integer :amount_cents
      t.integer :occurence_type

      t.timestamps
    end
  end
end
