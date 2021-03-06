class Api::V1::EffortsController < ApiController
  before_action :set_effort, only: [:show,:update]
  before_action :correct_user, only: [:show,:update]

  # ActiveRecordのレコードが見つからなければ404 not foundを応答する
  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: { error: '404 not found' }, status: 404
  end

  def index
    efforts = Effort.where(user: current_user).order("created_at ASC").limit(1)
    render json: efforts
  end

  def show
    render json: @effort
  end

  def create
   effort = Effort.new(effort_params)
    if effort.save
      render json: effort, status: :created
    else
      render json: { errors: effort.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @effort.update_attributes(effort_params)
      head :no_content
    else
      render json: { errors: @effort.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

    def set_effort
      @effort = Effort.find(params[:id])
    end

    def effort_params
      params.fetch(:effort, {}).permit(:change, :keep, :challenge, :influence,:surround, :endofyear).merge({ user: current_user })
    end

    def correct_user
      effort = Effort.find(params[:id])
      if current_user != effort.user
        redirect_to :root
      end
    end

    def render_status_404(exception)
      render json: { errors: [exception] }, status: 404
    end

    def render_status_500(exception)
      render json: { errors: [exception] }, status: 500
    end

    
end
