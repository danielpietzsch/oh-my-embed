require 'spec_helper'

describe OhMyEmbed::Providers::FacebookVideo do
  let(:provider) { OhMyEmbed::Providers::FacebookVideo }
  let(:content_url) { 'https://www.facebook.com/facebook/videos/10153231379946729/' }

  it 'the content_url matches the schema' do
    expect(provider.regex).to match content_url
  end

  it 'matches modern watch and reel urls' do
    expect(provider.regex).to match 'https://www.facebook.com/watch?v=10153231379946729'
    expect(provider.regex).to match 'https://www.facebook.com/watch/?v=10153231379946729'
    expect(provider.regex).to match 'https://www.facebook.com/reel/10153231379946729'
  end

  describe 'fetching' do
    it 'returns a video response with required attributes' do
      VCR.use_cassette('facebook_videos') do
        response = provider.fetch(content_url)

        expect(response).to be_a OhMyEmbed::Response

        expect(response.type).to eq :video

        expect(response.provider_name).to eq 'Facebook'
        expect(response.provider_url).to eq 'https://www.facebook.com'

        expect(response.url).to eq content_url

        # The Graph API oEmbed responses don't include title, author or thumbnail
        expect(response.title).to be nil
        expect(response.author).to be nil
        expect(response.thumbnail).to be nil

        expect(response.embed[:html]).to be_a String
        expect(response.embed[:width]).to eq 500
        expect(response.embed[:height]).to be nil
      end
    end
  end
end
