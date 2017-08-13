class UrlsController < ApplicationController

  def index
    @urls = Url.order(request_count: :desc).limit(100)
  end

  def new
    @url = Url.new
  end

  def create
    @response = Url::Create.new(create_params[:original]).()
    @url      = @response.model
    if @response.errors.empty?
      render json: { shortened: @url.shortened }
    else
      render json: { errors: @response.errors }, status: 404
    end
  end

  def show
    @url = Url.where(id: params[:id]).first
    @url
  end

  private

  def create_params
    params.require(:url).permit(:original)
  end
end
