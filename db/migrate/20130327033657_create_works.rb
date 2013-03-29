class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.references :genre
      t.string :title
      t.date :released_on

      t.timestamps
    end
    add_index :works, :genre_id
  end
end
