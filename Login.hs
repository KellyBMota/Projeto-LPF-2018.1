
--Módulo de login de usuário:
module Login (
    Cliente,
    login
) where

-- Módulos:
import System.IO
import System.IO.Error
import System.Process
import Control.Exception
import Control.Monad
import Cardapio
import Auxiliares
import Cadastro

--Definição de tipos de dados
type Nome = String
type Cpf = String
type Fone = String
type Senha = String
data Cliente = Cliente { nome :: String
                       , cpf :: String
                       , fone :: String
                       , senha :: String
                       } deriving(Show, Read, Eq)

--Função de login
login :: IO ()
login = do
         foo <- getLine
         putStrLn "\n*******************************************************************\n"
         putStrLn "\nAntes de realizar o pedido, por favor, faça o login: \n\n"
         putStrLn "Digite seu cpf: "
         cpf <- getLine
         putStrLn "Digite sua senha: "
         senha <- getLine
         arq <- openFile "arquivos/usuarios/usuarios.txt" ReadMode
         contents <- hGetContents arq
         let str = lines contents
             cCadastrados = fClientes str
         if isCadastrado cpf senha cCadastrados == True
            then do
               let user = usuario cpf cCadastrados
                   nome = getNome user
               putStrLn ("\n\nOlá, " ++ nome)
               mostrarCardapio
            else do
               putStrLn "\n\nSenha inválida ou usuário não cadastrado...\n\n1- Tentar Novamente\n2- Realizar Cadastro\n3- Sair"
               opcao <- getChar
               if opcao == '1'
                  then do
                      login
                  else do
                      if opcao == '2'
                         then do
                            cadastrar
                         else do
                            if opcao == '3'
                               then return ()
                               else return ()
         putStrLn "\n*******************************************************************\n"




{--Função que recebe uma lista de strings com informações dos clientes arquivados
e transforma em uma lista de clientes--}
fClientes :: [String] -> [Cliente]
fClientes [] = []
fClientes (a:as) = (Cliente {nome = (elemento 0 (words a)), cpf = (elemento 1 (words a)), fone = (elemento 2 (words a)), senha = (elemento 3 (words a))}):(fClientes as)

isCadastrado :: Cpf -> Senha -> [Cliente] -> Bool
isCadastrado _ _ [] = False
isCadastrado c s (a:as) | (c == getCpf a) && (s == getSenha a) = True
                        | otherwise = isCadastrado c s as

usuario :: Cpf -> [Cliente] -> Cliente
usuario c (a:as) | c == (getCpf a) = a
                 | otherwise = usuario c as 

getNome :: Cliente -> String
getNome Cliente {nome = n, cpf = c, fone = f, senha = s} = n

getCpf :: Cliente -> String
getCpf Cliente {nome = n, cpf = c, fone = f, senha = s} = c

getSenha :: Cliente -> String
getSenha Cliente {nome = n, cpf = c, fone = f, senha = s} = s




