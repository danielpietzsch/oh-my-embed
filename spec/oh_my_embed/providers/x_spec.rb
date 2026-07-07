require 'spec_helper'

describe OhMyEmbed::Providers::X do
  let(:provider) { OhMyEmbed::Providers::X }
  let(:content_url) { 'https://twitter.com/Interior/status/507185938620219395' }

  it 'the content_url matches the schema' do
    expect(provider.regex).to match content_url
  end

  it 'matches x.com status urls' do
    expect(provider.regex).to match 'https://x.com/Interior/status/507185938620219395'
    expect(provider.regex).to match 'https://www.x.com/Interior/status/507185938620219395'
  end

  describe 'fetching' do
    it 'returns a rich response with required attributes' do
      VCR.use_cassette('x') do
        response = provider.fetch(content_url)

        expect(response).to be_a OhMyEmbed::Response

        expect(response.type).to eq :rich

        expect(response.provider_name).to eq 'X'
        expect(response.provider_url).to eq 'https://x.com'

        expect(response.url).to eq 'https://x.com/Interior/status/507185938620219395'

        expect(response.title).to be nil

        expect(response.author).to eq({
          name: 'US Department of the Interior',
          url: 'https://x.com/Interior',
        })

        expect(response.thumbnail).to be nil

        expect(response.embed[:html]).to be_a String
        expect(response.embed[:width]).to eq 550
        expect(response.embed[:height]).to be nil
      end
    end
  end
end
