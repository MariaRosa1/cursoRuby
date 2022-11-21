class AdminStatistic < ApplicationRecord
  EVENT = {
    total_users: "TOTAL_USERS",
    total_questions: "TOTAL_QUESTIONS"
  }

  def self.set_total_users
    AdminStatistic.find_or_create_by(EVENT[:total])
  end

end
