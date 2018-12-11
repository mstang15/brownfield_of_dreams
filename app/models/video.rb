class Video < ApplicationRecord
  has_many :user_videos
  has_many :users, through: :user_videos
  belongs_to :tutorial
  validates_presence_of :position


  def self.position_assignment
    Video.where(position: nil).map do |video|
      video.update_attributes(position: Tutorial.find(video.tutorial_id).videos.maximum(:position)+1)
    end
  end
end
