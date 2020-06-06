require 'pry'

# Write your code here!
def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets", 
      :colors => ["Black", "White"],  
      :players => {
				"Alan Anderson" => {
					:number => 0,
					:shoe => 16,
					:points => 22,
					:rebounds => 12,
					:assists => 12,
					:steals => 3,
					:blocks => 1,
					:slam_dunks => 1
				},
				"Reggie Evans" => {
					:number => 30,
					:shoe => 14,
					:points => 12,
					:rebounds => 12,
					:assists => 12,
					:steals => 12,
					:blocks => 12,
					:slam_dunks => 7
				},
				"Brook Lopez" => {
					:number => 11,
					:shoe => 17,
					:points => 17,
					:rebounds => 19,
					:assists => 10,
					:steals => 3,
					:blocks => 1,
					:slam_dunks => 15
				},
				"Mason Plumlee" => {
					:number => 1,
					:shoe => 19,
					:points => 26,
					:rebounds => 11,
					:assists => 6,
					:steals => 3,
					:blocks => 8,
					:slam_dunks => 5
				},
				"Jason Terry" => {
					:number => 31,
					:shoe => 15,
					:points => 19,
					:rebounds => 2,
					:assists => 2,
					:steals => 4,
					:blocks => 11,
					:slam_dunks => 1
      }
    }
  },
    :away => { 
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
				"Jeff Adrien" => {
					:number => 4,
					:shoe => 18,
					:points => 10,
					:rebounds => 1,
					:assists => 1,
					:steals => 2,
					:blocks => 7,
					:slam_dunks => 2
				},
				"Bismack Biyombo" => {
					:number => 0,
					:shoe => 16,
					:points => 12,
					:rebounds => 4,
					:assists => 7,
					:steals => 22,
					:blocks => 15,
					:slam_dunks => 10
				},
				"DeSagna Diop" => {
					:number => 2,
					:shoe => 14,
					:points => 24,
					:rebounds => 12,
					:assists => 12,
					:steals => 4,
					:blocks => 5,
					:slam_dunks => 5
				},
				"Ben Gordon" => {
					:number => 8,
					:shoe => 15,
					:points => 33,
					:rebounds => 3,
					:assists => 2,
					:steals => 1,
					:blocks => 1,
					:slam_dunks => 0
				},
				"Kemba Walker" => {
					:number => 33,
					:shoe => 15,
					:points => 6,
					:rebounds => 12,
					:assists => 12,
					:steals => 7,
					:blocks => 5,
					:slam_dunks => 12
      }
      
    }
  }
}
end
####################
def player_helper
  game_hash[:home][:players].merge(game_hash[:away][:players])
end
####################
def get_team_helper(team)
  
  case team 
  when game_hash[:home][:team_name]
    game_hash[:home]
  when game_hash[:away][:team_name]
      game_hash[:away]
  end
end
####################
def player_numbers(team)
  get_team_helper(team)[:players].map do |player,value|
    value[:number]
  end
end
####################
def num_points_scored(player)
  
player_helper[player][:points]

end    
####################
def shoe_size(player)
  
  player_helper[player][:shoe]
  
end
####################
def team_colors(team)

  game_hash.values.each do |team_info|
    if team_info.has_value?(team)
      return team_info[:colors].map(&:capitalize)
    end
  end
end
####################
def team_names

game_hash.values.map {|value| value[:team_name]}

end
###################
def player_stats(player)
  
  player_helper[player]
  
end
###################
def big_shoe_rebounds
  biggest_shoe = 0
  num_rebounds = 0

player_helper.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          if stats[:shoe] > biggest_shoe
           biggest_shoe = stats[:shoe]
           num_rebounds = stats[:rebounds]
          end
        end
      end
    end
  end
  num_rebounds
end