class BookSerializer < ApplicationSerializer
  root_key :book, :books

  attributes :title, :published_at
end