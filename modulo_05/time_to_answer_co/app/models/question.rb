class Question < ApplicationRecord
  searchkick

  belongs_to :subject, counter_cache: true, inverse_of: :questions
  has_many :answers, dependent: :delete_all

  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true

  #callback
  after_create :set_statistic
  after_destroy :set_statistic_des

  # validates :answers, presence: true
  validates :subject_id, presence: true

  #kaminari
  paginates_per 10

  scope :_search_subject_, -> (page, subject_id){
    includes(:answers, :subject)
    .where(subject_id: subject_id)
    .page(page)
  }

  scope :_search_, -> (page, term){
    includes(:answers, :subject)
    .where("lower(description) LIKE ?", "%#{term.downcase}%")
    .page(page)
  }

  scope :last_questions, ->(page){
    includes(:answers, :subject)
    .order('created_at desc')
    .page(page)
  }

  scope :_search_alfhabetical_, ->(page){
    includes(:answers, :subject)
    .order('description')
    .page(page)
  }
  private

  def set_statistic
    AdminStatistic.set_event(AdminStatistic::EVENTS[:total_questions])
  end

  def set_statistic_des
    AdminStatistic.set_event_des(AdminStatistic::EVENTS[:total_questions])
  end

end
