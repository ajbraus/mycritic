class CreateCritics < ActiveRecord::Migration
  def change
    create_table :critics do |t|
      t.string :name
      t.string :url
      t.string :img_url

      t.timestamps
    end
    add_index :critics, :name
  end
end
