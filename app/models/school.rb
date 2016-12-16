# == Schema Information
#
# Table name: schools
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  location    :string
#  category    :string
#  avatar      :string
#  reviews     :integer
#  min_age     :integer
#  max_age     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#

class School < ActiveRecord::Base

  has_many :events, dependent: :destroy
  belongs_to :user

  validates :name, presence: true

  mount_uploader :avatar, SchoolAvatarUploader
  mount_uploader :cover, SchoolCoverUploader


end
