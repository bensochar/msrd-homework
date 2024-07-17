class QuizzesController < ApplicationController
  before_action :set_quiz, only: %i[ show edit update destroy ]

  inertia_share flash: -> { flash.to_hash }

  def index
    @quizzes = Quiz.all
    render inertia: 'Quiz/Index', props: {
      quizzes: @quizzes.map do |quiz|
        serialize_quiz(quiz)
      end
    }
  end

  def show
    render inertia: 'Quiz/Show', props: {
      quiz: serialize_quiz(@quiz)
    }
  end

  def new
    session[:quiz_params] ||= {}

    @quiz = Quiz.new(session[:quiz_params])
    @quiz.current_step = session[:quiz_step]

    render inertia: 'Quiz/New', props: {
      quiz: serialize_quiz(@quiz.attributes.merge(current_step: @quiz.current_step))
    }
  end

  def edit
    render inertia: 'Quiz/Edit', props: {
      quiz: serialize_quiz(@quiz)
    }
  end

  def create
    session[:quiz_params].deep_merge!(quiz_params) if quiz_params
    @quiz = Quiz.new(session[:quiz_params])
    @quiz.current_step = session[:quiz_step]
    if @quiz.valid?
      if @quiz.last_step?
        if @quiz.all_valid?
          if @quiz.save
            @quiz.current_step = @quiz.steps.first
            redirect_to @quiz, notice: "Quiz was successfully created."
          else
            redirect_to new_quiz_url, inertia: { errors: @quiz.errors }
          end
        end
      else
        @quiz.next_step
        render inertia: 'Quiz/New', props: {
          quiz: serialize_quiz(@quiz.attributes.merge(current_step: @quiz.current_step))
        }
      end
      session[:quiz_step] = @quiz.current_step
    else
      # render inertia: { errors: @quiz.errors }
      redirect_to new_quiz_url, inertia: { errors: @quiz.errors }
    end
  end

  # PATCH/PUT /quizzes/1
  def update
    if @quiz.update(quiz_params)
      redirect_to @quiz, notice: "Quiz was successfully updated."
    else
      redirect_to edit_quiz_url(@quiz), inertia: { errors: @quiz.errors }
    end
  end

  # DELETE /quizzes/1
  def destroy
    @quiz.destroy!
    redirect_to quizzes_url, notice: "Quiz was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz
      @quiz = Quiz.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def quiz_params
      params.require(:quiz).permit(:email, :weight, :birthdate)
    end

    def serialize_quiz(quiz)
      quiz.as_json(only: [
        :id, :email, :weight, :birthdate, :current_step
      ])
    end
end
