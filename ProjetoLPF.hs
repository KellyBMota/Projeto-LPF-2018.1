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
import System.Process


--definição de tipos de dados
type Clientes = [Cliente]
type Nome = String
type Cpf = String
type Endereco = String
type Fone = String
type Senha = String
type Preco = Float
type Bebidas = [(String, Preco)]
type Sobremesas = [(String, Preco)]
type Petiscos = [(String, Preco)]
type Principal = [(String, Preco)]
type Pedidos = [(String, Preco)]

data Cliente = Cliente Nome Cpf Endereco Fone Senha
               deriving(Show, Read, Eq)
data Restaurante = Restaurante Nome Endereco Cardapio Clientes Pedidos
                   deriving(Show, Read, Eq)
data Cardapio = Cardapio Bebidas Sobremesas Petiscos Principal
                deriving(Show, Read, Eq)



--função menu
main = do
       putStrLn "Bem-vindo ao aplicativo FoodFast! Realize a operação desejada: "
       putStrLn "1-Cadastro"
       putStrLn "2-Login"
       putStrLn "3-Fechar aplicativo"
       opcao <- getChar
       if opcao == ' '
         then return ()
         else do
           if opcao == '1'
             then do
               cadastro
               main
             else do
               if opcao == '2'
                 then do
                   login
                   main
                 else return ()

--função Cadastro
cadastro :: IO ()
cadastro = do
        putStrLn "Cadastro feito com sucesso"

 --função Login
login :: IO ()
login = do
        putStrLn "Login feito com sucesso"
