class Challenge < ActiveRecord::Base
  belongs_to :user
  validates :team_name, presence: true, length: {maximum: 255}
  validates :link, presence: true, uniqueness: true
  validates :name, presence: true, length: {maximum: 255}
  validates :user_id, presence: true
  #validates :team_id, presence: true
end
