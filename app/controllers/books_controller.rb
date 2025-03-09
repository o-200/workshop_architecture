class BooksController < ApplicationController
  def index
    page  = params[:page] || 0
    count = params[:count] || Settings.app.items_per_page
    books = BookDocument.page(page).per(count)

    render json: BookSerializer.new(books).serialize
  end
end
