module Cardapio (
    mostrarCardapio
) where
import Control.Exception
import System.IO
import System.IO.Error
import Control.Monad
import System.Process
import Data.List
import TCardapio

type Preco = Float
type Bebidas = [(String, Preco)]
type Sobremesas = [(String, Preco)]
type Petiscos = [(String, Preco)]
type Principal = [(String, Preco)]
type Pedido = [(String, Preco)]

mostrarCardapio = do
    putStrLn "\n\n Escolha uma das opções: \n1- Pratos Principais\n2- Petiscos\n3- Sobremesas\n4- Bebidas\n5- Fechar Pedido"
    opcao <- getChar
    if opcao == '1'
                  then do
                      pratosPrincipais
                  else do
                      if opcao == '2'
                         then do
                            petiscos
                         else do
                            if opcao == '3'
                               then do
                                  sobremesas
                               else do
                                  if opcao == '4'
                                     then do
                                        bebidas
                                     else do
                                        if opcao == '5'
                                           then do
                                               putStrLn "Pedido Realizado!"
                                           else do
                                               mostrarCardapio

    

    

