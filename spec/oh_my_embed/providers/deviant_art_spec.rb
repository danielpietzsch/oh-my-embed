require 'spec_helper'

describe OhMyEmbed::Providers::DeviantArt do
  let(:provider) { OhMyEmbed::Providers::DeviantArt }
  let(:content_url) { 'https://www.deviantart.com/rootwork/art/Sylvis-Portrait-Icon-1313561920' }

  it 'the content_url matches the schema' do
    expect(provider.regex).to match content_url
  end

  it 'matches old-style deviation and short urls' do
    expect(provider.regex).to match 'http://pachunka.deviantart.com/art/Cope-145564099'
    expect(provider.regex).to match 'http://fav.me/d2enxz7'
  end

  describe 'fetching' do
    it 'returns a photo response with required attributes' do
      VCR.use_cassette('deviantart') do
        response = provider.fetch(content_url)

        expect(response).to be_a OhMyEmbed::Response

        expect(response.type).to eq :photo

        expect(response.provider_name).to eq 'DeviantArt'
        expect(response.provider_url).to eq 'https://www.deviantart.com'

        expect(response.url).to start_with 'https://images-wixmp'

        expect(response.title).to eq 'Sylvis, Portrait Icon'

        expect(response.author).to eq({
          name: 'rootwork',
          url: 'https://www.deviantart.com/rootwork',
        })

        expect(response.thumbnail[:url]).to be_a String
        expect(response.thumbnail[:width]).to eq 300
        expect(response.thumbnail[:height]).to eq 300

        expect(response.embed[:html]).to be nil
        expect(response.embed[:width]).to eq '380'
        expect(response.embed[:height]).to eq '380'
      end
    end
  end
end
