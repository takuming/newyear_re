class Api::V1::LbmonthsController < ApiController
  before_action :set_lbmonth, only: [:show, :update]

  # ActiveRecordのレコードが見つからなければ404 not foundを応答する
  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: { error: '404 not found' }, status: 404
  end

  def index
    lbmonths = Lbmonth.all
    render json: lbmonths
  end

  def show
    render json: @lbmonth
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
      params.fetch(:lbmonth, {}).permit(:jan,:feb,:mar,:apr,:may,:jun,:jul,:aug,:sep,:oct,:nov,:dec)
    end
end
