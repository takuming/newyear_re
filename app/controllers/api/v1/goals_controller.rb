class Api::V1::GoalsController < ApiController
  before_action :set_goal, only: [:show,:update, :destroy]

  # ActiveRecordのレコードが見つからなければ404 not foundを応答する
  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: { error: '404 not found' }, status: 404
  end

  def index
    goals = Goal.all
    render json: goals
  end

  def show
    render json: @goal
  end

  def create
   goal = Goal.new(goal_params)
    if goal.save
      render json: goal, status: :created
    else
      render json: { errors: goal.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @goal.update_attributes(goal_params)
      head :no_content
    else
      render json: { errors: @goal.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @goal.destroy!
    head :no_content
  end

  private

    def set_goal
      @goal = Goal.find(params[:id])
    end

    def goal_params
      params.fetch(:goal, {}).permit(:title, :action, :problem)
    end

    def render_status_404(exception)
      render json: { errors: [exception] }, status: 404
    end

    def render_status_500(exception)
      render json: { errors: [exception] }, status: 500
    end
end
