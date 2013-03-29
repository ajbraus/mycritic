class CriticsGenres < ActiveRecord::Migration
  def change
  	create_table :critics_genres, :id => false do |t|
      t.references :critic
    	t.references :genre
    end
    add_index :critics_genres, [:critic_id, :genre_id]
    add_index :critics_genres, [:genre_id, :critic_id]
  end
end


	Genre.create!(name: "Movies", id:1)
  Genre.create!(name: "Music", id:2)
  Genre.create!(name: "Games", id:3)
  
  Genre.all.each do |g|
  	for i in 1..10 do
  		g.critics.create!(name:"critic #{i}", url:"nytimes.com")
  	end

  	for i in 1..100 do 
  		Work.create!(title:"work #{i}", released_on: Time.now - 3.weeks, genre: g)
  	end

		Work.joins(:genres).where('genres.id = ?', g.id).each do |w|
  		@num = ([*1..100]).sample #random number between 1-100
  		@critics = Critic.joins(:genres).where('genres.id = ?', g.id).randomly_pick(60) #random sample of 60 critics per genre
			@critics.each do |cr|
				Review.create!(work_id: w.id, critic_id: cr.id, score: @num, published_on: Time.now - 1.week, url:"http://www.google.com")
			end
  	end
  end
