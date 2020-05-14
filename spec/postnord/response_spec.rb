require 'spec_helper'

RSpec.describe Postnord::Response do
  let(:body) { { 'test' => 'body' } }
  let(:data) { OpenStruct.new(status: 200, body: body.to_json) }
  subject { Postnord::Response.new(data) }

  describe '#code' do
    it 'returns the status from data' do
      expect(subject.code).to eq(200)
    end
  end

  describe '#data' do
    it 'returns the desirialized json body' do
      expect(subject.data).to eq(body)
    end
  end

  describe 'to_h' do
    it 'returns a hash based on the given data' do
      expect(subject.to_h).to eq({
        code: 200,
        data: body
      })
    end
  end
end
