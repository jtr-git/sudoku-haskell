data SudokuConfig = SudokuConfig [Int]

sudokuConfigFromList :: [Int] -> SudokuConfig
sudokuConfigFromList [] = SudokuConfig ([])
sudokuConfigFromList lst = SudokuConfig (lst)

listFromSudokuConfig :: SudokuConfig -> [Int]
listFromSudokuConfig (SudokuConfig lst) = lst

instance Show SudokuConfig where
show config = listFromSudokuConfig (config)

row :: Int -> [Int] -> [Int]
row 0 _ = SudokuConfig ( [] )
row i (SudokuConfig lst) = SudokuConfig(sublist lst (9*i-8) (9*i))

col :: Int -> [Int] -> [Int]
col i [] = []
col i lst = head(drop (i-1) lst):(col i (drop 9 lst))

grid :: Int -> [Int] -> [Int]
grid i lst = gridHelper ([1,4,7,28,31,34,55,58,61]!!(succ(i))) lst

gridHelper :: Int -> [Int] -> [Int]
gridHelper i lst = (sublist lst i (i+2)) ++ (sublist lst (9+i) (11+i)) ++ (sublist lst (18+i) (20+i)) 

sublist :: [Int] -> Int -> Int -> [Int]
sublist [] _  _ = []
sublist _ 0 0 = []
sublist lst start end =  take (end - start + 1) (drop (pred start) lst)


