class CreateSubmissions < ActiveRecord::Migration[6.0]
  def change
    create_table :submissions do |t|
      t.references :exercice, null: false, foreign_key: true

      t.timestamps
    end
  end
end
