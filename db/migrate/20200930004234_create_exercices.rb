class CreateExercices < ActiveRecord::Migration[6.0]
  def change
    create_table :exercices do |t|

      t.timestamps
    end
  end
end
