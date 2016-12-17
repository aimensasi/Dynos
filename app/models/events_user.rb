# == Schema Information
#
# Table name: events_users
#
#  event_id      :integer
#  user_id       :integer
#  tickets_count :integer
#  total_price   :integer
#
# Indexes
#
#  index_events_users_on_event_id  (event_id)
#  index_events_users_on_user_id   (user_id)
#

class EventsUser < ActiveRecord::Base

end
