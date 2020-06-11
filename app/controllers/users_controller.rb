class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @age = ((Time.zone.now - @user.dob.to_time) / 1.year.seconds).floor
    @recently_played = Game.recently_played(@user.id)
    @most_played = Game.most_played(@user.id)
  end

  def steam_index
  end

  def get_steamid

    Steam.apikey = 'AD695F812D4F6784FAB5C7D81851B92C'

    require 'uri'
    require 'net/http'
    require 'json'
    keyword = params[:search]

    vanity = params[:vanity]
    steamid = Steam::User.vanity_to_steamid(vanity)
    apikey = 'AD695F812D4F6784FAB5C7D81851B92C'

    respond_to do |format|
      if steamid.nil?
        format.html { render :steam_index, notice: "Vanity not valid" }
      else
        session[:steamid] = steamid
        summary = URI("http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=#{apikey}&steamids=#{steamid}")

        response = Net::HTTP.get(summary)
        result = JSON.parse(response)

        result['response']['players'].each do |child|
          @username = child['personaname']
          @avatar = child['avatarfull']
        end

        format.html { render :steam_confirm }
      end
    end

  end

  def add_steam_account

    games = Steam::Player.owned_games(session[:steamid], params: {include_appinfo: true})
    recent_games = Steam::Player.recently_played_games(session[:steamid])

    games['games'].each do |game|
      new_game = Game.new(user_id: current_user.id, name: game['name'], playtime: game['playtime_forever'], img_url: game['img_logo_url'], appid: game['appid'])
      if new_game.save!
        puts 'User saved'
      else
        # User not saved
      end
    end

    recent_games['games'].each do |game|

      current_user.games.each do |games|
        if game['name'].eql? games.name
          games.update(recent: true)
        end
      end
    end

    if current_user.update!(steam_connected: true)
      flash[:alert] = "Steam successfully connected"
    else
      flash[:alert] = "Not connected"
    end
  end

end
