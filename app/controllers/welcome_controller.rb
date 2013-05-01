class WelcomeController < ApplicationController
  def index
  end

  def faq
  end

  def pick_genre
  	@genre = Genre.find_by_name(params[:name])
  	@critics = @genre.critics
  end

  def index_works
  	@works = Work.return_works(params[:critic_ids], params[:genre_id])
  end
end
