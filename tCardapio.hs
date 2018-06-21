module TCardapio (
     pratosPrincipais,
     petiscos,
     sobremesas,
     bebidas   
) where

import System.FilePath
import Auxiliares
import Control.Exception
import System.IO
import System.IO.Error
import Control.Monad
import System.Process
import Data.Char

pratosPrincipais = do 
    arq <- openFile "arquivos\\cardapio\\pratosPrincipais.txt" ReadMode
    contents1 <- hGetContents arq
    let pratos = lines contents1
        opcoes = zipWith (\n line -> show n ++ " - " ++ line) [0..] pratos
    putStr $ unlines opcoes
    choice <- getLine
    putStrLn $ "opção escolhida:" ++ choice    
    let number = read choice     
        itemPedido = (pratos !! number)
    appendFile "arquivos\\pedido.txt" (itemPedido ++ "\n")
    hFlush arq
    hClose arq


petiscos = do
    arq1 <- openFile "arquivos\\cardapio\\petiscos.txt" ReadMode
    contents2 <- hGetContents arq1
    let pratos = lines contents2
        opcoes = zipWith (\n line -> show n ++ " - " ++ line) [0..] pratos
    putStr $ unlines opcoes
    choice <- getLine
    putStrLn $ "opção escolhida:" ++ choice    
    let number = read choice     
        itemPedido = (pratos !! number)
    appendFile "arquivos/pedido.txt" (itemPedido ++ "\n")
    hFlush arq1
    hClose arq1

sobremesas = do
    arq2 <- openFile "arquivos/Cardapio/sobremesas.txt" ReadMode
    contents3 <- hGetContents arq2
    let pratos = lines contents3
        opcoes = zipWith (\n line -> show n ++ " - " ++ line) [0..] pratos
    putStr $ unlines opcoes
    choice <- getLine
    putStrLn $ "opção escolhida:" ++ choice    
    let number = read choice     
        itemPedido = (pratos !! number)
    appendFile "arquivos/pedido.txt" (itemPedido ++ "\n")
    hFlush arq2
    hClose arq2

bebidas = do
    arq3 <- openFile "arquivos/Cardapio/bebidas.txt" ReadMode
    contents4 <- hGetContents arq3
    let pratos = lines contents4
        opcoes = zipWith (\n line -> show n ++ " - " ++ line) [0..] pratos
    putStr $ unlines opcoes
    choice <- getLine
    putStrLn $ "opção escolhida:" ++ choice    
    let number = read choice     
        itemPedido = (pratos !! number)
    appendFile "arquivos/pedido.txt" (itemPedido ++ "\n")
    hFlush arq3
    hClose arq3