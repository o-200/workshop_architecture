class BooksController < ApplicationController
  def index
    page  = params[:page] || 1
    count = params[:count] || Settings.app.items_per_page
    _, books = pagy(Book, page: page, limit: count)

    render json: BookSerializer.new(books).serialize
  end
end
