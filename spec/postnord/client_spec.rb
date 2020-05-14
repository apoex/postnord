require 'spec_helper'

RSpec.describe Postnord::Client do
  subject { Postnord::Client.new(api_version: 'v1', api_key: 'test', api_endpoint: 'test_endpoint', locale: 'sv', return_type: 'json') }

  before do
    stub_request(:get, /test_endpoint/).to_return(status: 200, body: '{ "test": "data" }', headers: {})
  end

  it 'does the request' do
    res = subject.do_request('service', 'endpoint')

    expect(res.code).to eq(200)
    expect(res.data).to eq({ 'test' => 'data' })
  end
end
