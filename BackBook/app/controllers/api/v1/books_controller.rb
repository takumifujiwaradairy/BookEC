class Api::V1::BooksController < ApplicationController
  def index
    books = Book.ransack(params[:q]).result(distinct: true)
    render json: books
  end
end