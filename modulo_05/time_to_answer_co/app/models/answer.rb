class Answer < ApplicationRecord
  belongs_to :question
  after_create :set_answer_redis

  private
    def set_answer_redis
      Rails.cache.write(self.id, "#{self.question_id}@@#{self.correct}")
    end
end
