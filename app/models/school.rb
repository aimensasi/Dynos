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
	include PgSearch

  has_many :events, dependent: :destroy
  belongs_to :user

  validates :name, presence: true
  validates :category, :inclusion => {:in => ['Private', 'Public', 'International'], :allow_nil => true}
 
  mount_uploader :avatar, SchoolAvatarUploader
  # mount_uploader :cover, SchoolCoverUploader

  pg_search_scope :pg_address, :against => :location, using: { :tsearch => {:prefix => true, :any_word => true} }

  scope :by_address, -> (query) {
  	return all unless query.present?
  	pg_address(query)
  }

  scope :by_age, -> (min_age, max_age){
  	return all unless min_age.present? && max_age.present?
  	where(:min_age => min_age..max_age, :max_age => min_age..max_age)
  }

  scope :by_category, -> (category){
  	return all unless category.present?
  	where(:category => category.downcase)
  }

  def self.filters search_params
  	by_address(search_params[:location])
  	.by_age(search_params[:min_age], search_params[:max_age])
    .by_category(search_params[:category])
  end

end















