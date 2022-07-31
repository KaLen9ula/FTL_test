class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.string :title
      t.text :description
      t.string :category
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
