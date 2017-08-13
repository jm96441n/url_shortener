class RedirectsController < ApplicationController

  def show
    @url = Url.where(shortened: params[:shortened]).first
    if @url.original[0..3].downcase != 'http'
      redirect_to 'http://' + @url.original
    else
      redirect_to @url.original
    end
  end
end
