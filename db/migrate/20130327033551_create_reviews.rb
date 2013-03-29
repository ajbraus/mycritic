class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :work
      t.references :critic
      t.integer :score
      t.string :url
      t.date :published_on

      t.timestamps
    end
    add_index :reviews, :work_id
    add_index :reviews, :critic_id
  end
end
