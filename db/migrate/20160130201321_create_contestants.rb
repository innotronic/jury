class CreateContestants < ActiveRecord::Migration
  def change
    create_table :contestants do |t|
      t.string :name
      t.string :number, null: false, index: true, unique: true
      t.float :score, index: true, default: 0
      t.references :category, null: false, index: true, foreign_key: true
      
      t.timestamps null: false
    end
  end
end
