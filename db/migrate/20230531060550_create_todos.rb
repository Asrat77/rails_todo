class CreateTodos < ActiveRecord::Migration[7.0]
  def change
    create_table :todos do |t|
      t.string :title
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.integer :status
      

      t.timestamps
    end
  end
end
