import Data.Char

-- represents the initial board of the game
initialBoard :: [Int]
initialBoard = [5,4,3,2,1]

-- function that return the next player who has a turn
next :: Int -> Int
next 1 = 2
next 2 = 1

-- utility function to print a newline to the console
newline :: IO ()
newline = putChar '\n'

-- takes an inpu and checks if it is a digit and return it, if not asks for input again
getDigit :: String -> IO Int
getDigit message = do putStr message
                      x <- getChar
                      newline
                      if isDigit x then
                        do return (digitToInt x)
                      else 
                        do putStrLn "Invalid input"
                           getDigit message

-- utility function to print the board onto the console
printBoard :: [Int] -> IO ()
printBoard board = putStr $ unlines [(show row) ++ ": " ++ replicate stars '*'| (stars, row) <- zip board [1..length board]]

-- checks the end condition for the game
checkEnd :: [Int] -> Bool
checkEnd board = all (==0) board

-- checks whether a move is valid or not
checkValidMove :: [Int] -> Int -> Int -> Bool
checkValidMove board row rStars = if (board !! (row - 1)) >= rStars then True else False

-- generates a new board once a move has been played
generateNewBoard :: [Int] -> Int -> Int -> [Int]
generateNewBoard board row rStars = [if irow == row then stars - rStars else stars | (stars, irow) <- zip board [1..length board]]

-- makes use of the do notation to run a loop for the game
playnim :: [Int] -> Int -> IO ()
playnim board player = do printBoard board
                          if checkEnd board then
                            do putStr "Player "
                               putStr (show (next player))
                               putStrLn " wins!"
                          else
                            do putStr "Player "
                               putStrLn (show player)
                               row <- getDigit "Enter row number: "
                               stars <- getDigit "Enter stars to remove: "
                               if checkValidMove board row stars then
                                 playnim (generateNewBoard board row stars) (next player)
                               else
                                 do putStrLn "Invalid move"
                                    playnim board player
                
-- call this function to start the game with the initial conditions
nim :: IO ()
nim = playnim initialBoard 1


                            