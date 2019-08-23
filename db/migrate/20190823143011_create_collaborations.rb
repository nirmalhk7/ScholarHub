class CreateCollaborations < ActiveRecord::Migration[5.2]
  def change
    create_table :collaborations do |t|
      t.references :user, foreign_key: true
      t.references :institute, foreign_key: true
      t.string :title
      t.text :description
      t.text :fields
      t.boolean :closed, default: false

      t.timestamps
    end
  end
end
