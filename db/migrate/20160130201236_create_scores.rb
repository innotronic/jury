class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.references :contestant, null: false, index: true, foreign_key: true
      t.references :judge, null: false, index: true, foreign_key: true
      t.float :value
      
      t.timestamps null: false
    end
  end
end
