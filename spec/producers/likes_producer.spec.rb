# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LikesProducer, type: :model do
  describe '.get_likes' do
    let(:book_id) { 123 }
    let(:mock_response) { { likes_count: 10 } }

    before do
      allow(Karafka).to receive(:producer).and_return(double('Producer', produce_sync: mock_response))
    end

    it 'returns count of likes of the book' do
      result = LikesProducer.get_likes(book_id)

      expect(Karafka).to have_received(:producer).once
      expect(Karafka.producer).to have_received(:produce_sync)
                                    .with(value: { book_id: book_id }.to_json, topic: 'likes_topic')

      expect(result).to eq(10)
    end
  end
end
