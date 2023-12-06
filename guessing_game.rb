require 'csv'
require 'io/console'
pokemon = []
CSV.foreach("./pokemon.csv", headers: true) do |row| 
pokemon << row["name"]
end

def get_random_pokemon(pokemon)
    random_pokemon = pokemon.sample
end


def guessing_game(pokemon)
    
puts <<-'EOF'
⠐⣶⣾⣭⣷⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⡄⠀⠄⠀⠀⠀⠀⠀
⠀⠹⣿⣿⣧⠈⠙⠳⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⠴⢻⣿⣿⣿⢇⠀⠀⠀⠀⠀
⠀⠀⠘⢿⣿⡄⠀⠀⠀⠙⢿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡴⠛⠉⠀⠀⣿⣿⣿⣿⠇⠀⠀⠀⠀⠀
⠀⠀⠀⠈⠻⣧⠀⠀⠀⠀⠀⠙⢿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⠟⠉⠀⠀⠀⠀⢰⣿⣿⡿⠃⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠘⢷⣀⠀⠀⠀⠀⠀⠹⣦⡀⠀⢀⣀⣀⣀⣰⣶⣦⣀⣀⡀⠀⠀⣠⡶⠋⠁⠀⠀⠀⠀⠀⢀⣾⡻⠋⠀⠀⡀⣀⣄⣤⡤⣦
⠀⠀⠀⠀⠀⠀⠀⠙⢦⣄⠀⠀⠀⠀⠈⣷⠶⠛⠉⠉⠁⠀⠀⠈⠉⠉⠛⠿⡿⠟⠁⠀⠀⠀⠀⢀⣠⣶⡿⠋⣀⣤⠼⠗⠛⠉⠁⠀⠀⡟
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⠷⢦⣀⣰⠖⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣄⣤⣶⣟⣣⡽⡿⠟⠋⠀⠀⠀⠀⠀⠀⢀⣾⡟
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢐⡿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠒⠿⡷⠟⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣼⠏⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢫⣯⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡇⠀⣴⣿⠻⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⣴⡻⣿⣷⡀⠀⢹⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠃⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⠇⠀⣿⡿⢿⣿⠃⠀⠀⠀⣀⣀⠀⠀⠀⣿⣿⣿⣿⠇⠀⢸⡀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣤⣴⣾⠟⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⡤⣤⡈⠉⠉⠁⠀⠀⠀⠀⠉⠉⠀⠀⠀⠀⠉⠛⠃⢀⣠⣈⣧⠀⠀⣤⣴⡶⠿⠿⠛⠉⠉⠁⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡇⠀⠀⠙⣦⠀⠀⠀⠳⠤⠴⠞⠛⠦⣤⠾⠃⠀⠀⣼⠋⠀⠈⣿⠀⠀⠈⣷⣶⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣷⡄⠀⢀⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠄⠀⣰⡟⠀⠀⠀⠀⠻⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣶⣛⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢒⣶⣿⢻⣷⣤⠀⠀⠀⠈⢻⣦⡀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣽⡇⠙⠳⣦⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⠶⠋⢸⡷⠞⠋⠀⣀⣠⣶⠞⠿⠙⠃⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⡿⠁⠀⠀⠀⠉⠓⠭⣷⣦⣤⣤⡴⠦⣺⠛⠉⠀⠀⠀⠈⣷⠀⢶⣿⣟⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡞⠁⠀⠀⠀⠀⠀⠀⠀⣦⠀⠀⠀⠀⣰⠏⠀⠀⠀⠀⠀⠀⠘⣷⣀⣨⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡆⠀⠀⢀⡟⠀⠀⠀⠀⠀⠀⠀⠀⠘⢿⡋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣠⣄⣀⣠⡟⠀⢀⡄⠀⠀⠀⠀⠀⠀⠀⠈⣇⠀⠀⣼⠁⠀⠀⠀⠀⠀⠀⢀⡇⠀⠘⣷⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢰⣿⣿⣛⣿⣁⠀⠀⣧⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⣿⠀⠀⠀⠀⠀⠀⠀⣾⠁⠀⠀⢸⣱⣿⣷⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠈⢿⣿⠻⣤⣉⠷⠀⠸⣇⠀⠀⠀⠀⠀⠀⠀⣿⠰⠠⡏⠀⠀⠀⠀⠀⠀⣰⠇⠀⢀⡴⢛⣱⣿⣿⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠈⠛⢷⡀⠈⠳⣄⠀⠹⣦⠀⠀⠀⠀⠀⠀⡟⠀⠀⣷⠀⠀⠀⠀⠀⣰⠏⠀⢀⣴⠚⠉⣸⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢹⣦⡀⠈⠃⣦⠘⢷⡀⠀⠀⠀⢀⣧⣤⣤⣿⠀⠀⠀⢀⣼⠃⣀⠒⠛⢀⣤⣾⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣛⣦⠴⢿⢶⣿⣿⡤⢴⣶⢿⡛⠁⠙⣿⣶⣤⣤⣾⣗⢶⣯⣤⣴⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
EOF
range_start = 0
range_end = 3
random_pokemon = get_random_pokemon(pokemon)
guesses_remaining = 2
puts " \r"
puts " \r"
puts " \r"
puts "Welcome to Guess that Pokemon!"
puts " \r"
puts "Press any key to start."
STDIN.getch
puts " \r"
puts ("You have" + " " + guesses_remaining.to_s + " " + "guesses left.")
puts " \r"
puts ("Im thinking of a pokemon that starts with the letters:" + " " + "\'" + random_pokemon[range_start, range_end] + "\'")
puts " \r"
puts "Make a guess:"
puts " \r"
guess = gets.chomp()
puts " \r"
while guesses_remaining != 0
    if guess.downcase == random_pokemon.downcase
        guesses_remaining = 3
        puts " \r"
        puts "Wow, you are a great Pokemon trainer. You guessed correctly, YOU WIN!"
        puts " \r"
        puts "Press any key to restart the game."
        puts " \r"
        puts " \r"
        guessing_game(pokemon)
    elsif guesses_remaining > 0
        range_end += 1
        guesses_remaining -= 1
        if guesses_remaining == 0
        puts "You are on your last guess. Make it count!"
        puts " \r"
        elsif guesses_remaining == 1
        puts "You have 1 guess left."
        puts " \r"
        else
        puts ("You have" + " " + guesses_remaining.to_s + " " + "guesses left.")
        puts " \r"
        end
        puts ("INCORRECT. The Pokemon I'm thinking of starts with these letters: " + random_pokemon[range_start, range_end])
        puts " \r"
        puts "Make a guess:"
        puts " \r"
        guess = gets.chomp()
        puts " \r"
    end
end
    puts "YOU LOSE. You ran out of guesses. The Pokemon was #{random_pokemon}."
    puts " \r"
    puts "Press any key to play again."
    STDIN.getch
    puts " \r"
    puts " \r"
    puts " \r"
    guessing_game(pokemon)
end






guessing_game(pokemon)


