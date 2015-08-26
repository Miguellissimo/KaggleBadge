class ChallengesController < ApplicationController
  def new
  end

  def create
    if logged_in?
      @challenge = current_user.challenges.build(challenge_params)

      # Extracting the competition name
      @challenge.name = 'Extracting challenge name ...'
      Delayed::Job.enqueue(CompetitionNameJob.new(@challenge.link, current_user.id))      
      @challenge.save
    end 

    redirect_to request.referrer
  end

private
  def challenge_params
    params.require(:challenge).permit(:team_name, :link)
  end
end
