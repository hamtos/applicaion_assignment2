class SearchesController < ApplicationController
  def search
    @words = params[:words]
    @range = params[:range]
    if @range == "User"
      @users = User.looks(params[:search], @words)
    else
      @books = Book.looks(params[:search], @words)
    end
  end

end
