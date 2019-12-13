# Nim-Game Haskell

This is a simple nim game written in Haskell. It uses simple IO () and represents the nim-board as a list of the type [5,4,3,2,1] where each number is the number of stars in that row.

````
1: * * * * * 
2: * * * * 
3: * * * 
4: * * 
5: * 
````
## Rules

Two players take it turn about to remove one or more stars from the end of a single row. The winner is the player who removes the last star or stars from the board.

# Example
```
*Main> nim

1: * * * * * 
2: * * * * 
3: * * * 
4: * * 
5: * 

Player 1
Enter a row number: 1
Stars to remove: 5

1: 
2: * * * * 
3: * * * 
4: * * 
5: * 

Player 2
Enter a row number: 4
Stars to remove: 2

1: 
2: * * * * 
3: * * * 
4: 
5: * 

Player 1
Enter a row number: 2
Stars to remove: 4

1: 
2: 
3: * * * 
4: 
5: * 

Player 2
Enter a row number: 3
Stars to remove: 3

1: 
2: 
3: 
4: 
5: * 

Player 1
Enter a row number: 5
Stars to remove: 1

1: 
2: 
3: 
4: 
5: 

Player 1 wins!
```

