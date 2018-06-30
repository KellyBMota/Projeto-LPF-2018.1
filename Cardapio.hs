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
import PedidoFinal

type Preco = Float
type Bebidas = [(String, Preco)]
type Sobremesas = [(String, Preco)]
type Petiscos = [(String, Preco)]
type Principal = [(String, Preco)]
type Pedido = [(String, Preco)]

mostrarCardapio = do
    putStrLn "\n*******************************************************************\n"
    putStrLn "\n Escolha uma das opções: \n\n1- Hamburguers\n2- Petiscos\n3- Sobremesas\n4- Bebidas\n5- Fechar Pedido"
    opcao <- getChar
    if opcao == '1'
                  then do
                      hamburguers
                      mostrarCardapio
                  else do
                      if opcao == '2'
                         then do
                            petiscos
                            mostrarCardapio
                         else do
                            if opcao == '3'
                               then do
                                  sobremesas
                                  mostrarCardapio
                               else do
                                  if opcao == '4'
                                     then do
                                        bebidas
                                        mostrarCardapio
                                     else do
                                        if opcao == '5'
                                           then do
                                               mostrarPedido
                                           else do
                                               mostrarCardapio
    putStrLn "\n*******************************************************************\n"

    

    

