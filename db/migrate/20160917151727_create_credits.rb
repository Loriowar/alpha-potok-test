class CreateCredits < ActiveRecord::Migration[5.0]
  def change
    create_table :credits do |t|
      t.decimal :amount
      t.decimal :duration
      t.decimal :period
      t.decimal :annual_rate_base
      t.decimal :annual_rate_delay
      t.integer :user_id, index: true

      t.timestamps
    end
  end
end
