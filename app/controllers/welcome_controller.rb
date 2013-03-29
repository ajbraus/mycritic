class WelcomeController < ApplicationController
  def index
  end

  def faq
  end

  def pick_genre
    binding.pry
  	@genre = Genre.find(params[:genre_id])
  	@critics = @genre.critics
  end

  def index_works
  	@critic_ids = params[:critic_ids]
    @genre_id = @critic_ids.first.genre.id
  	@works = return_works(@critic_ids, @genre_id)
  end
end
