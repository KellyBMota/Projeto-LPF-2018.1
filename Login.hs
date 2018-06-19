
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

--Definição de tipos de dados
data Tipo = TNome 
            | TCpf 
            | TFone 
            | TSenha
            deriving (Eq)
type Nome = String
type Cpf = String
type Fone = String
type Senha = String
data Cliente = Cliente Nome Cpf Fone Senha
               deriving(Show, Read, Eq)

--Função de login
login :: IO ()
login = do
         foo <- getLine
         putStrLn "Digite seu cpf: "
         cpf <- getLine
         putStrLn "Digite sua senha: "
         senha <- getLine
         arq <- readFile "arquivos/usuarios.txt"
         let clientes = ler arq
         if (isCadastrado cpf senha clientes) == True
           then do
             let usuario = user cpf senha clientes
             putStrLn ("Olá, " ++ (infoCliente TNome usuario))
             putStrLn "Cardapio aberto..."
           else do
             putStrLn "Usuario Inválido"
             putStrLn "1 - Sair"
             putStrLn "2 - Tentar Novamente"
             option <- getChar
             if option == '1'
               then return ()
               else do
                 if option == '2'
                   then do
                     login
                   else return ()


--Função de leitura de dados do arquivo para identificar todos os clientes
--Faz a leitura completa do arquivo e separa os clientes em uma lista de clientes
--A função words recebe uma string e retorna uma lista com as palavras separadas
ler :: String -> [Cliente]
ler [] = []
ler str = (cliente (words (take ((index ';' str)-1) str))):(ler (drop ((index ';' str)+1) str))

--Função de identificação de cliente a partir da string do arquivo
--Recebe uma lista de Strings, onde cada string contem os dados de um só cliente
cliente :: [String] -> Cliente
cliente [] = error "lista vazia do cliente"
cliente str = Cliente (info' TNome str) (info' TCpf str) (info' TFone str) (info' TSenha str)


--Função auxiliar que separa informações do cliente
info' :: Tipo -> [String] -> String
info' _ [] = error "lista vazia da info"
info' tipo str | tipo == TNome = (elemento str 1)
               | tipo == TCpf = (elemento str 2)
               | tipo == TFone = (elemento str 3)
               | tipo == TSenha = (elemento str 4)
               | otherwise = error "Tipo Inválido!"

--Função retorna um dado do cliente
infoCliente :: Tipo -> Cliente -> String
infoCliente tipo (Cliente nome cpf fone senha) | tipo == TNome = nome
                                               | tipo == TCpf = cpf
                                               | tipo == TFone = fone
                                               | tipo == TSenha = senha
                                               | otherwise = error "Tipo Inválido!" 

--Função verifica se o usuário já está cadastrado
isCadastrado :: Cpf -> Senha -> [Cliente] -> Bool
isCadastrado _ _ []= False
isCadastrado _ [] _ = error "Dados incompletos"
isCadastrado [] _ _ = error "Dados incompletos"
isCadastrado cpf senha (l:ls) | (infoCliente TCpf l == cpf) && (infoCliente TSenha l == senha) = True
                              | otherwise = isCadastrado cpf senha ls 

--Função que recebe um cpf e uma senha e retorna o cliente cadastrado
user :: Cpf -> Senha -> [Cliente] -> Cliente
user _ _ [] = error "Nenhum usuario cadastrado"
user [] _ _ = error "Dados incompletos"
user _ [] _ = error "Dados incompletos"
user cpf senha list@(l:ls) | (isCadastrado cpf senha list) == False = error "Usuario Invalido"
                              | (infoCliente TCpf l == cpf) = l 
                              | otherwise = user cpf senha ls


--Função que retorna o indice do elemento em uma lista
index :: (Eq t)=> t -> [t] -> Int
index _ [] = error "Elemento não existe na lista"
index e (l:ls) | e == l = 0
               | otherwise = 1 + (index e ls)

--Função que retorna o elemento de uma lista dado o indice
elemento :: [t] -> Int -> t
elemento [] _ = error "Lista vazia"
elemento (x:xs) 0 = x
elemento (x:xs) a = elemento xs (a-1)




