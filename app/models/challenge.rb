class Challenge < ActiveRecord::Base
  belongs_to :user
  after_save :reload_page
  validates :team_name, presence: true, length: {maximum: 255}
  validates :link, presence: true, uniqueness: true
  #validates :team_id, presence: true

  def reload_page
    #render 'new'
    puts 'record has been updated'
    redirect_to :back
  end
end
