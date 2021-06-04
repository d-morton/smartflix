class AddNotNullConstraintToMoviesTitle < ActiveRecord::Migration[6.0]
  def up
    change_table :movies do |t|
      t.change :title, :string, null: false
    end
  end

  def down
    change_table :movies do |t|
      t.change :title, :string, null: true
    end
  end
end
