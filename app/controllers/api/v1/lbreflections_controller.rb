class Api::V1::LbreflectionsController < ApiController
  before_action :set_lbreflection, only: [:show, :update]

  # ActiveRecordのレコードが見つからなければ404 not foundを応答する
  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: { error: '404 not found' }, status: 404
  end

  def index
    lbreflections = Lbreflection.where(user: current_user).order("created_at ASC").limit(1)
    render json: lbreflections
  end

  def show
    render json: @lbreflection
  end

  def create
    lbreflection = Lbreflection.new(lbreflection_params)
    if lbreflection.save
      render json: lbreflection, status: :created
    else
      render json: { errors: lbreflection.errors.full_messages }, status: :unprocessable_entity
    end
  end


  def update
    if @lbreflection.update_attributes(lbreflection_params)
      head :no_content
    else
      render json: { errors: @lbreflection.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

    def set_lbreflection
      @lbreflection = Lbreflection.find(params[:id])
    end

    def lbreflection_params
      params.fetch(:lbreflection, {}).permit(:missing, :taking, :worry, :guilt, :anger, :sorrow, :jealousy).merge({ user: current_user })
    end
end
