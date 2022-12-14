class AdminsBackoffice::QuestionsController < AdminsBackofficeController
  before_action :set_question, only: [:edit, :update, :destroy]
  before_action :get_subjects, only: [:new, :edit]
  before_action :get_answers, only: [:new, :edit]


  def index
    @questions = Question.includes(:subject, :answers)
                          .order(:subject)
                          .page(params[:page])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(params_question)

    if @question.answers.blank? || @question.answers.size < 2
      redirect_to new_admins_backoffice_question_path, notice: "Não foi possivel pois precisa de repostas!"
      puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
    else
      @question.save
      redirect_to admins_backoffice_questions_path, notice: "Questão cadastrada com sucesso!"
    end
  end

  def edit
  end

  def update
    if @question.update(params_question)
      redirect_to admins_backoffice_questions_path, notice: "Questão atualizada com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    if @question.destroy
     redirect_to admins_backoffice_questions_path, notice: "Questão excluída com sucesso!"
    else
      render :index
    end
  end

  def search_by_question
    @questions = Question._search_(params[:page], params[:term])
  end

  private

  def params_question
    params.require(:question).permit(:description, :subject_id,
      answers_attributes: [:id, :description, :correct, :_destroy])
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def get_subjects
    @subjects = Subject.all
  end

  def get_answers
    @answers = Answer.all
  end
end