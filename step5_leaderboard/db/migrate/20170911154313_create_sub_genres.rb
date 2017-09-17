class CreateSubGenres < ActiveRecord::Migration[5.1]
  def change
    create_table :sub_genres do |t|
      t.string :subgen
      t.string :gen

      t.timestamps
    end
  end
end
