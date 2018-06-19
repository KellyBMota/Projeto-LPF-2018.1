module TCardapio (
     pratosPrincipais,
     petiscos,
     sobremesas,
     bebidas   
) where

pratosPrincipais = do 
    arq <- openFile "arquivos/Cardapio/pratosPrincipais.txt" ReadMode
    contents <- hGetContents arq
    let pratos = lines contents
        opcoes = zipWith (\n line -> show n ++ " - " ++ line) [0..] pratos
    putStr $ unlines opcoes
    choice <- getLine
    putStrLn $ "opção escolhida:" ++ choice    
    let number = read choice     
        itemPedido = (pratos !! number)
    appendFile "arquivos/pedido.txt" (itemPedido ++ "\n") 

petiscos = do
	arq <- openFile "arquivos/Cardapio/petiscos.txt" ReadMode
    contents <- hGetContents arq
    let pratos = lines contents
        opcoes = zipWith (\n line -> show n ++ " - " ++ line) [0..] pratos
    putStr $ unlines opcoes
    choice <- getLine
    putStrLn $ "opção escolhida:" ++ choice    
    let number = read choice     
        itemPedido = (pratos !! number)
    appendFile "arquivos/pedido.txt" (itemPedido ++ "\n") 

sobremesas = do
	arq <- openFile "arquivos/Cardapio/sobremesas.txt" ReadMode
    contents <- hGetContents arq
    let pratos = lines contents
        opcoes = zipWith (\n line -> show n ++ " - " ++ line) [0..] pratos
    putStr $ unlines opcoes
    choice <- getLine
    putStrLn $ "opção escolhida:" ++ choice    
    let number = read choice     
        itemPedido = (pratos !! number)
    appendFile "arquivos/pedido.txt" (itemPedido ++ "\n") 

 bebidas = do
	arq <- openFile "arquivos/Cardapio/bebidas.txt" ReadMode
    contents <- hGetContents arq
    let pratos = lines contents
        opcoes = zipWith (\n line -> show n ++ " - " ++ line) [0..] pratos
    putStr $ unlines opcoes
    choice <- getLine
    putStrLn $ "opção escolhida:" ++ choice    
    let number = read choice     
        itemPedido = (pratos !! number)
    appendFile "arquivos/pedido.txt" (itemPedido ++ "\n") 