import Data.Char

initialBoard :: [Int]
initialBoard = [5,4,3,2,1]

next :: Int -> Int
next 1 = 2
next 2 = 1

newline :: IO ()
newline = putChar '\n'

getDigit :: String -> IO Int
getDigit message = do putStr message
                      x <- getChar
                      newline
                      if isDigit x then
                        do return (digitToInt x)
                      else 
                        do putStrLn "Invalid input"
                           getDigit message

printBoard :: [Int] -> IO ()
printBoard board = putStr $ unlines [(show row) ++ ": " ++ replicate stars '*'| (stars, row) <- zip board [1..length board]]

checkEnd :: [Int] -> Bool
checkEnd board = all (==0) board

checkValidMove :: [Int] -> Int -> Int -> Bool
checkValidMove board row rStars = if (board !! (row - 1)) >= rStars then True else False

generateNewBoard :: [Int] -> Int -> Int -> [Int]
generateNewBoard board row rStars = [if irow == row then stars - rStars else stars | (stars, irow) <- zip board [1..length board]]

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
                                    
nim :: IO ()
nim = playnim initialBoard 1


                            