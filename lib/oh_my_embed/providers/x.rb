module OhMyEmbed
  module Providers
    class X < OhMyEmbed::Provider
      # X (formerly Twitter) oembed documentation:
      # https://developer.x.com/en/docs/x-for-websites/oembed-api

      self.endpoint = 'https://publish.x.com/oembed'
      self.schemes = [
        '//twitter.com/*/status/*',
        '//*.twitter.com/*/status/*',
        '//x.com/*/status/*',
        '//*.x.com/*/status/*',
      ]
    end
  end
end
