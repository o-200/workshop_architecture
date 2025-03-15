class BookDocument
  include Mongoid::Document
  include Mongoid::Timestamps

  field :id, type: String, default: ->{ BSON::ObjectId.new.to_s }
  field :created_at, type: DateTime
  field :updated_at, type: DateTime
  field :title, type: String
  field :series, type: String
  field :serno, type: String
  field :libid, type: Integer
  field :size, type: Integer
  field :filename, type: Integer
  field :del, type: Boolean, default: false
  field :ext, type: String
  field :published_at, type: DateTime
  field :insno, type: String
  field :folder_id, type: String
  field :language_id, type: String
end
