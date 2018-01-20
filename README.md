# games_bfox

Welcome to the games_bfox gem!

## Versions
Ruby 2.4.0, rbenv 1.1.1

## How to Run

### ...from the command line 
To run from command line, you must install the gem on your machine: 

    $ gem install games_bfox

To play either game (choosing at run time), type the following into your command line:

    $ games

To play Mastermind, type the following into your command line: 

    $ mastermind

To play Tic Tac Toe, type the following into your command line:

    $ tictactoe
    
To exit at any time, type the following into your command line:

    $ exit

### ...from inside the project

Clone the project, cd into the project directory, and then run the following commands:
 
    $ bundle install 
    $ bundle exec ruby lib/games.rb

## How to Test
From inside the project directory, run the following command:

    $ bundle exec rspec