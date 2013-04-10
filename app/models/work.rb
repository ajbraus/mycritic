class Work < ActiveRecord::Base
  belongs_to :genre
  has_many :reviews
  attr_accessible :title, :released_on
  
  validates :title, presence: true

  def self.return_works(critic_ids, genre_id)
  	genre = Genre.find(genre_id)
  	@critic_ids = critic_ids

		@works_array = []
		@critic_ids.each do |c|
  		critic = Critic.find(c)   
   		works = critic.reviews.each do |r| 
   			if r.work.genre == genre
   				@works_array.push r.work
   			end
   		end
   	end
  	#@works_array = Work.joins(:review => :critic).where('critics.id IN ? AND works.genre_id = ? AND works.released_on > ?', @critic_ids, @genre_id, Time.now - 6.weeks)
		@agg_scores_array = []
		@works_array.each do |w|
			@reviews = w.reviews.select { |r| @critic_ids.include?(r.critic.id.to_s) } #reviews by chosen critics of work w
			if @reviews.size > 0
				@reviews_critics = @reviews.map {|r| r.critic }
				@scores = @reviews.map { |r| r.score } #their scores
				@critic_weights_array = [] #get array of critic weights
				@reviews_critics.each_with_index do |critic_id, index|
					@n = @reviews.count #SECRET SAUCE
					@critic_weight = (1/2)**index #SECRET SAUCE
					@critic_weights_array.push(@critic_weight)
				end
				@sum_of_weights = @critic_weights_array.inject{|sum,x| sum + x }
				@critic_weights_array = @critic_weights_array.map {|c| c/@sum_of_weights }
				#dot product of the array of the weights and array of for the scores
				sum, i, size = 0, 0, @scores.size
	      while i < size
	        sum += @scores[i] * @critic_weights_array[i]
	        i += 1
	      end
		    @agg_score = sum
		    @agg_scores_array.push(@agg_score)
		  end
	  end

		@work_score_hash = Hash[@works_array.zip(@agg_scores_array)]	# => { #<work> => "aggregate_score", #<work> => "aggregate_score", . . . }	
		return @works_score_hash

		# abandoned sort_by method
		#	@works.sort_by do |w|
	  # 		@critic_ids.each_with_index do |critic_id, index|
	  # 			@n = w.reviews.joins(:critics).where('critics.id IN ?', @critic_ids).count
	  # 			@critic_weight = 2*1-(1/2)^@n/2^index
	  # 			@critic_ids.each do |ci|
	  # 				@score = w.reviews.find_by_critic_id(ci).score

	  # 			end
	  # 		end
	  # 	end
  	# end
  end
end
