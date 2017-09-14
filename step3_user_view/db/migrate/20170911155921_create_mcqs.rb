class CreateMcqs < ActiveRecord::Migration[5.1]
  def change
    create_table :mcqs do |t|
      t.string :question
      t.string :optA
      t.string :optB
      t.string :optC
      t.string :optD
      t.string :corrOpt
      t.string :subgen
      t.string :gen

      t.timestamps
    end
  end
end
