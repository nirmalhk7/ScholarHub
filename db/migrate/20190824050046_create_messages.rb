class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :content, default: ''
      t.boolean :read, default: false
      t.integer :sender_id
      t.integer :reciever_id
      t.references :conversation, foreign_key: true

      t.timestamps
    end
  end
end
