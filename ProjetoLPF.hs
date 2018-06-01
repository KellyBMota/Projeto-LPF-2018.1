{-
    Projeto LPF - Ifood
    Alunos: Daniel Almeida
            Estyvison Linhares
            Kelly Bezerra
            Paulo Guilherme
-}

--Módulos:
import Control.Exception
import System.IO
import System.IO.Error
import Control.Monad


--definição de tipos de dados
type Clientes = [Cliente]
type Nome = String
type Cpf = String
type Endereco = String
type Fone = String
type Preco = Float
type Bebidas = [(String, Preco)]
type Sobremesas = [(String, Preco)]
type Petiscos = [(String, Preco)]
type Principal = [(String, Preco)]
type Pedido = [(String, Preco)]

data Cliente = Cliente Nome Cpf Endereco Fone
               deriving(Show, Read, Eq)
data Restaurante = Restaurante Nome Endereco Cardapio Clientes Pedidos
                   deriving(Show, Read, Eq)
data Cardapio = Cardapio Bebidas Sobremesas Petiscos Principal
                deriving(Show, Read, Eq)
