--module Cardapio (
--   mostrarCardapio
--) where
import TCardapio
import Control.Exception
import System.IO
import System.IO.Error
import Control.Monad
import System.Process
import Data.List
import Data.Char

type Preco = Float
type Bebidas = [(String, Preco)]
type Sobremesas = [(String, Preco)]
type Petiscos = [(String, Preco)]
type Principal = [(String, Preco)]
type Pedido = [(String, Preco)]

main :: IO()
main = do 
        foo <- getLine
        putStrLn "Bem vindo ao nosso umildi estabelecimento, aqui estão as opciones :"
        arq5 <- openFile "arquivos/Cardapio/cardapioGeral.txt" ReadMode
        contents <- hGetContents arq5
        let showArq = lines contents
        opciones = zipWith (\n line -> show n ++ " - " ++ line) [0..] showArq
        putStr $ unlines opciones
        opcao <- getLine
        putStrLn $ "opção escolhida:" ++ opcao  --f(g(x)) -> f $ g x     
        let number = read opcao     
        if number == 0
            then do
            bebidas
        else do 
            if number == 1
                then do
                petiscos
            else do
                if number == 2
                    then do
                    pratosPrincipais
                else do
                    if number == 3
                        then do
                        sobremesas
                    else do 
                        if number == 4
                            then do
                            putStrLn "finalizarPedido"
                        else do 
                            return()




