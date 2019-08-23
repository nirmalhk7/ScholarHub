class AddFieldToPapers < ActiveRecord::Migration[5.2]
  def change
    add_column :papers, :title, :string

    Paper.all.each do |paper|
      paper.update(title: "A paper on #{paper.fields.join(', ')}")
    end
  end
end
