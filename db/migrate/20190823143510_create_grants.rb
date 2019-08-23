class CreateGrants < ActiveRecord::Migration[5.2]
  def change
    create_table :grants do |t|
      t.string :title, default: ''
      t.text :description, default: ''
      t.date :submission_deadline
      t.integer :amount, default: 0
      t.text :fields, default: ''

      t.timestamps
    end
  end
end
