module OhMyEmbed
  module Providers
    class FacebookVideo < OhMyEmbed::Provider
      # Facebook oembed documentation:
      # https://developers.facebook.com/docs/plugins/oembed
      # https://developers.facebook.com/docs/graph-api/reference/oembed-video
      #
      # Officially the Graph API oEmbed endpoints require an access token,
      # but they currently answer tokenless requests for public content.

      self.endpoint = 'https://graph.facebook.com/v25.0/oembed_video'
      self.schemes = [
        '//www.facebook.com/*/videos/*',
        '//www.facebook.com/video.php?id=*',
        '//www.facebook.com/video.php?v=*',
        '//www.facebook.com/watch?v=*',
        '//www.facebook.com/watch/?v=*',
        '//www.facebook.com/reel/*',
      ]
    end
  end
end
