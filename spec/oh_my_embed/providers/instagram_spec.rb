require 'spec_helper'

describe OhMyEmbed::Providers::Instagram do
  let(:provider) { OhMyEmbed::Providers::Instagram }
  let(:content_url) { 'https://www.instagram.com/p/fA9uwTtkSN/' }

  it 'the content_url matches the schema' do
    expect(provider.regex).to match content_url
  end

  it 'matches short and reel urls' do
    expect(provider.regex).to match 'http://instagr.am/p/fA9uwTtkSN'
    expect(provider.regex).to match 'https://www.instagram.com/reel/CzTWjU5K8Hl/'
  end

  describe 'fetching' do
    it 'returns a rich response with required attributes' do
      VCR.use_cassette('instagram') do
        response = provider.fetch(content_url)

        expect(response).to be_a OhMyEmbed::Response

        expect(response.type).to eq :rich

        expect(response.provider_name).to eq 'Instagram'
        expect(response.provider_url).to eq 'https://www.instagram.com/'

        expect(response.url).to eq content_url

        # The Graph API oEmbed responses don't include title, author or thumbnail
        expect(response.title).to be nil
        expect(response.author).to be nil
        expect(response.thumbnail).to be nil

        expect(response.embed[:html]).to be_a String
        expect(response.embed[:width]).to eq 658
        expect(response.embed[:height]).to be nil
      end
    end
  end
end
