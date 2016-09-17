class CreateCreditPayments < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_payments do |t|
      t.decimal :amount
      t.integer :credit_id, index: true

      t.timestamps
    end
  end
end
