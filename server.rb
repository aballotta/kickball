require 'sinatra'
require 'sinatra/reloader'
require 'csv'

require 'pry'

def get_teams(players)
  get_players.each do
end

def get_players
  players = []

  CSV.foreach('lackp_starting_rosters.csv', headers: true) do |row|
    player = row.to_hash
    players << player
  end

  return players
end

get '/players' do
  @players = get_players

  erb(:players)
end

get '/teams' do
  players = get_players
  binding.pry

  erb :index
end

# /positions/catcher
# /positions/1st base
# /positions/pitcher
get '/positions/:position' do
  # position = params[:position]
  erb :position
end

# /teams/Red Sox
# /teams/Yankees
# /teams/Simpson Slammers
get '/teams/:team' do
  # team = params[:team]
  erb :team
end

