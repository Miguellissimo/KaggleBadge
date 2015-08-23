class ChallengesController < ApplicationController
  def new
  end

  def create
    if logged_in?
      @challenge = current_user.challenges.build(challenge_params)
      @challenge.name = competition_name ''
      @challenge.save
    end 

    redirect_to request.referrer
  end

private
  def challenge_params
    params.require(:challenge).permit(:team_name, :link)
  end

  def competition_name(link)
    'Not yet implemented'
  end
end
