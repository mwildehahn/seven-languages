
def main()
    number = rand(1..10)
    guess = 0

    puts 'Guess the number between 1 and 10!'
    while true do
        guess = (gets).to_i

        if guess == number
            puts "You're right!"
            break
        elsif guess < number
            puts "Too low!"
        else
            puts "Too high!"
        end
    end
end

main()
