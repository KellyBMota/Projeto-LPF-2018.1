module TCardapio (
     hamburguers,
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

hamburguers = do 
    foo <- getLine
    arqmostrar <- openFile "arquivos\\cardapioFastFlix\\hamburguers.txt" ReadMode
    arqler <- openFile "arquivos\\cardapio\\hamburguers.txt" ReadMode
    contents1 <- hGetContents arqler
    contents2 <- hGetContents arqmostrar
    let pratos1 = lines contents1
        pratos2 = lines contents2
    putStr $ unlines pratos2
    choice <- getLine
    putStrLn $ "opção escolhida:" ++ choice    
    let number = read choice     
        itemPedido = (pratos1 !! number)
    appendFile "arquivos\\pedido.txt" (itemPedido ++ "\n")
    hFlush arqler
    hFlush arqmostrar
    hClose arqler
    hClose arqmostrar


petiscos = do
    foo <- getLine
    arqmostrar <- openFile "arquivos\\cardapioFastFlix\\petiscos.txt" ReadMode
    arqler <- openFile "arquivos\\cardapio\\petiscos.txt" ReadMode
    contents1 <- hGetContents arqler
    contents2 <- hGetContents arqmostrar
    let pratos1 = lines contents1
        pratos2 = lines contents2
    putStr $ unlines pratos2
    choice <- getLine
    putStrLn $ "opção escolhida:" ++ choice    
    let number = read choice     
        itemPedido = (pratos1 !! number)
    appendFile "arquivos\\pedido.txt" (itemPedido ++ "\n")
    hFlush arqler
    hFlush arqmostrar
    hClose arqler
    hClose arqmostrar

sobremesas = do
    foo <- getLine
    arqmostrar <- openFile "arquivos\\cardapioFastFlix\\sobremesas.txt" ReadMode
    arqler <- openFile "arquivos\\cardapio\\sobremesas.txt" ReadMode
    contents1 <- hGetContents arqler
    contents2 <- hGetContents arqmostrar
    let pratos1 = lines contents1
        pratos2 = lines contents2
    putStr $ unlines pratos2
    choice <- getLine
    putStrLn $ "opção escolhida:" ++ choice    
    let number = read choice     
        itemPedido = (pratos1 !! number)
    appendFile "arquivos\\pedido.txt" (itemPedido ++ "\n")
    hFlush arqler
    hFlush arqmostrar
    hClose arqler
    hClose arqmostrar

bebidas = do
    foo <- getLine
    arqmostrar <- openFile "arquivos\\cardapioFastFlix\\bebidas.txt" ReadMode
    arqler <- openFile "arquivos\\cardapio\\bebidas.txt" ReadMode
    contents1 <- hGetContents arqler
    contents2 <- hGetContents arqmostrar
    let pratos1 = lines contents1
        pratos2 = lines contents2
    putStr $ unlines pratos2
    choice <- getLine
    putStrLn $ "opção escolhida:" ++ choice    
    let number = read choice     
        itemPedido = (pratos1 !! number)
    appendFile "arquivos\\pedido.txt" (itemPedido ++ "\n")
    hFlush arqler
    hFlush arqmostrar
    hClose arqler
    hClose arqmostrar