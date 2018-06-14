module Cardapio (
    mostrarCardapio
) where
import Control.Exception
import System.IO
import System.IO.Error
import Control.Monad
import System.Process
import Data.List

type Preco = Float
type Bebidas = [(String, Preco)]
type Sobremesas = [(String, Preco)]
type Petiscos = [(String, Preco)]
type Principal = [(String, Preco)]
type Pedido = [(String, Preco)]


mostrarCardapio = do
    foo <- getLine
    putStrLn "Bem vindo ao nosso umildi estabelecimento, aqui estao alguma opciones de bebidas:"
    arq <- openFile "arquivos/Cardapio.txt" ReadMode
    contents <- hGetContents arq
    let showArq = lines contents
        opciones = zipWith (\n line -> show n ++ " - " ++ line) [0..] showArq
    putStr $ unlines opciones
    opcao <- getLine
    putStrLn $ "opção escolhida:" ++ opcao  --f(g(x)) -> f $ g x     
    let number = read opcao     
        itemPedido = (showArq !! number)
    appendFile "arquivos/Pedido.txt" (itemPedido ++ "\n") 

    {--tratarArq :: String -> [String]
    tratarArq [] = error "pedido vazio"
    tratarArq arq = $ splitOn ";" arq

    splitOn' :: String -> String -> [String]
    splitOn' [] _ = error "lista vazia"
    splitOn' a b = splitOn b a--}



