require 'pathname'

require "openid"
require 'openid/extensions/sreg'
require 'openid/extensions/pape'
require 'openid/store/filesystem'

class SessionsController < ApplicationController

  def get_steam
    Steam.apikey = 'AD695F812D4F6784FAB5C7D81851B92C'

    # id = Steam::User.vanity_to_steamid("ismailsabet")
    #
    # result = Steam::Player.owned_games(id, params: {:include_appinfo => true})
    #
    # result['games'].each do |child|
    #   puts child['name']
    # end

    provider = Provider.new(issuer: 'https://steamcommunity.com/openid', name: 'Steam', )

  end

end
