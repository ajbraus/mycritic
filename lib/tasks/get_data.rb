require 'csv'

Genre.all.each do |g|
  g.destroy
end
Critic.all.each do |c|
  c.destroy
end
Work.all.each do |w|
  w.destroy
end
Review.all.each do |r|
  r.destroy
end

#DONE create genres
Genre.create!(name: "Movies", id:1)
Genre.create!(name: "Music", id:2)
Genre.create!(name: "Games", id:3)
@games = Genre.find_by_name("Games")

#create works in genre
#work,published_on,critic,score
CSV.foreach("sample.csv") do |row|
  work_title = row[0]
  released_on = Date.strptime(row[1], "%b %d- %Y")
  unless Work.find_by_title(work_title).present?
    @games.works.create!(released_on: released_on, title: work_title)
  end
end

#create critics with critic/genre pairs in has_and_belongs_to_many table
#work,published_on,critic,score
CSV.foreach("sample.csv") do |row|
  critic = row[2]
  unless Critic.find_by_name(critic).present?
    @games.critics.create!(name: critic)
  end
end

#create review with critic and work
#work,published_on,critic,score
CSV.foreach("sample.csv") do |row|
  work_title = row[0]
  @work = Work.find_by_title(work_title)
  published_on = row[1]
  critic = row[2]
  @critic = Critic.find_by_name(critic)
  score = row[3]
  Review.create!(work_id: @work.id, critic_id: @critic.id, score: score)
end