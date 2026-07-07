module OhMyEmbed
  module Providers
    class FacebookPost < OhMyEmbed::Provider
      # Facebook oembed documentation:
      # https://developers.facebook.com/docs/plugins/oembed
      # https://developers.facebook.com/docs/graph-api/reference/oembed-post
      #
      # Officially the Graph API oEmbed endpoints require an access token,
      # but they currently answer tokenless requests for public content.

      self.endpoint = 'https://graph.facebook.com/v19.0/oembed_post'
      self.schemes = [
        '//www.facebook.com/*/posts/*',
        '//www.facebook.com/*/activity/*',
        '//www.facebook.com/photo.php?fbid=*',
        '//www.facebook.com/photos/*',
        '//www.facebook.com/permalink.php?story_fbid=*',
        '//www.facebook.com/media/set?set=*',
        '//www.facebook.com/questions/*',
        '//www.facebook.com/notes/*/*/*',
      ]
    end
  end
end
