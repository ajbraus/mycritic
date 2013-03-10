class WelcomeController < ApplicationController
  def index
  	@email_subscription = EmailSubscription.new
  	@subscription_counter = EmailSubscription.all.count

  end
end
