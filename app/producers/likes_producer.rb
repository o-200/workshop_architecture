class LikesProducer
  def self.get_likes(book_id)
    return if book_id.blank?

    message = { book_id: book_id }
    response = Karafka.producer.produce_sync(value: message.to_json, topic: 'likes_topic')

    response[:likes_count]
  end
end
