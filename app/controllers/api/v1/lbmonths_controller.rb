class Api::V1::LbmonthsController < ApiController
  before_action :set_lbmonth, only: [:show, :update]
  before_action :correct_user, only: [:index,:show,:update]

  # ActiveRecordのレコードが見つからなければ404 not foundを応答する
  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: { error: '404 not found' }, status: 404
  end

  def index
    lbmonths = Lbmonth.where(user: current_user)
    render json: lbmonths
  end

  def show
    render json: @lbmonth
  end

  def create
    lbmonth = Lbmonth.new(lbmonth_params)
     if lbmonth.save
       render json: lbmonth, status: :created
     else
       render json: { errors: lbmonth.errors.full_messages }, status: :unprocessable_entity
     end
   end

  def update
    if @lbmonth.update_attributes(lbmonth_params)
      head :no_content
    else
      render json: { errors: @lbmonth.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

    def set_lbmonth
      @lbmonth = Lbmonth.find(params[:id])
    end

    def lbmonth_params
      params.fetch(:lbmonth, {}).permit(:jan,:feb,:mar,:apr,:may,:jun,:jul,:aug,:sep,:oct,:nov,:dec).merge({ user: current_user })
    end

    def correct_user
      lbmonth = Lbmonth.find(params[:id])
      if current_user != lbmonth.user
        redirect_to :root
      end
    end

end
