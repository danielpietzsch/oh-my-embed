module OhMyEmbed
  module Providers
    class Instagram < OhMyEmbed::Provider
      # Instagram oembed documentation:
      # https://developers.facebook.com/docs/instagram-platform/oembed
      #
      # Officially the Graph API oEmbed endpoints require an access token,
      # but they currently answer tokenless requests for public content.

      self.endpoint = 'https://graph.facebook.com/v25.0/instagram_oembed'
      self.schemes = [
        '//instagr.am/p/*',
        '//instagram.com/p/*',
        '//*.instagram.com/p/*',
        '//instagr.am/reel/*',
        '//instagram.com/reel/*',
        '//*.instagram.com/reel/*',
      ]
    end
  end
end
