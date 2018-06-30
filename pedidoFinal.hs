module PedidoFinal (
    mostrarPedido
) where

import Control.Exception
import System.IO
import System.IO.Error
import Control.Monad
import System.Process
import Data.List
import Auxiliares

mostrarPedido = do
    foo <- getLine
    putStrLn "\n*******************************************************************\n"
    putStrLn "\n Aqui está seu pedido. Obrigado pela preferência!"
    arq <- openFile "arquivos\\pedido.txt" ReadMode
    contents1 <- hGetContents arq
    let pedido = lines contents1
        opcoes = zipWith (\n line -> show n ++ " - " ++ line) [0..] pedido
    putStr $ unlines opcoes
    let conta = contaFinal pedido
    putStrLn ("\nTotal:      " ++ (show conta))
    putStrLn "\nPressione Enter para voltar ao menu"
    foo2 <- getLine
    putStrLn "\n*******************************************************************\n"
    writeFile "arquivos\\pedido.txt" ""
    hClose arq

contaFinal :: [String] -> Float
contaFinal [] = 0
contaFinal (a:as) = (rFloat (last (words a))) + (contaFinal as) 