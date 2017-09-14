class CreateStates < ActiveRecord::Migration[5.1]
  def change
    create_table :states do |t|
      t.integer :userid
      t.string :genre
      t.string :subgenre
      t.string :qsnid
      t.integer :score

      t.timestamps
    end
  end
end
