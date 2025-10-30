class CreateMovies < ActiveRecord::Migration[8.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :director
      t.integer :duration
      t.text :plot, default: "A cool movie"
      t.string :location, default: "Canada"

      t.timestamps
    end
  end
end
