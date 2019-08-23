class CreatePapers < ActiveRecord::Migration[5.2]
  def change
    create_table :papers do |t|
      t.references :user, foreign_key: true
      t.string :journal_link
      t.references :institute, foreign_key: true
      t.text :fields
      t.text :abstract
      t.string :title

      t.timestamps
    end
  end
end
