class Api::V1::LbcuriositiesController < ApiController
  before_action :set_lbcuriosity, only: [:show, :update]
  before_action :correct_user, only: [:show,:update]

  # ActiveRecordのレコードが見つからなければ404 not foundを応答する
  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: { error: '404 not found' }, status: 404
  end

  def index
    lbcuriosities = Lbcuriosity.where(user: current_user).order("created_at ASC").limit(1)
    render json: lbcuriosities
  end

  def show
    render json: @lbcuriosity
  end

  def create
    lbcuriosity = Lbcuriosity.new(lbcuriosity_params)
    if lbcuriosity.save
      render json: lbcuriosity, status: :created
    else
      render json: { errors: lbcuriosity.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @lbcuriosity.update_attributes(lbcuriosity_params)
      head :no_content
    else
      render json: { errors: @lbcuriosity.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

    def set_lbcuriosity
      @lbcuriosity = Lbcuriosity.find(params[:id])
    end

    def lbcuriosity_params
      params.fetch(:lbcuriosity, {}).permit(:trance, :positive ,:interesting, :comfortable, :theme, :investment).merge({ user: current_user }).merge({ user: current_user })
    end

    def correct_user
      lbcuriosity = Lbcuriosity.find(params[:id])
      if current_user != lbcuriosity.user
        redirect_to :root
      end
    end

end
