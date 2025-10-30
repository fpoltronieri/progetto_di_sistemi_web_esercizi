class CreateCastings < ActiveRecord::Migration[8.1]
  def change
    create_table :castings do |t|
      t.references :movie, null: false, foreign_key: true
      t.references :actor, null: false, foreign_key: true
      t.string :character

      t.timestamps
    end
  end
end
