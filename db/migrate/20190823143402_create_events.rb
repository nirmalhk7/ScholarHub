class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.references :institute, foreign_key: true
      t.string :title
      t.text :description
      t.text :fields
      t.boolean :certification
      t.integer :price
      t.date :start_date
      t.date :end_date
      t.text :phone_numbers

      t.timestamps
    end
  end
end
