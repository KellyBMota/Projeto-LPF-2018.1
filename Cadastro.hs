module Cadastro (
     cadastrar
) where

import Auxiliares
import Control.Exception
import System.IO
import System.IO.Error
import Control.Monad
import System.Process
import Data.Char

cadastrar = do
            foo <- getLine
            arq <- openFile "arquivos/usuarios/usuarios.txt" ReadMode
            contents <- hGetContents arq
            let clientes = lines contents
            putStrLn "\n*******************************************************************\n"
            putStrLn "Cadastro:\n"
            putStrLn "Digite seu nome: "
            nome <- getLine
            if nome == ""
              then do
              putStrLn "Nome inválido. Tente o cadastro novamente."
              fErro
              else do
                    if (possui nome)
                      then do
                         putStrLn "Nome não pode possuir número. Tente o cadastro novamente."
                         fErro
                      else do
                         putStrLn "Digite seu cpf: "
                         cpf <- getLine
                         if cpf == ""
                           then do
                             putStrLn "Cpf invalido. Tente o cadastro novamente."
                             fErro
                           else do
                             if((length cpf) /= 11)
                               then do
                                 putStrLn "Cpf inválido. Tente o cadastro novamente."
                                 fErro
                               else do
                                  if(possuiLetra cpf)
                                     then do
                                         putStrLn "Cpf inválido. Tente o cadastro novamente."
                                         fErro
                                     else do
                                         if(elem cpf (cpfCadast clientes))
                                             then do
                                                 putStrLn "Cpf já existente. Tente o cadastro novamente."
                                                 fErro
                                             else do
                                                 putStrLn "Digite seu telefone: "
                                                 fone <- getLine
                                                 if fone == ""
                                                        then do
                                                            putStrLn "Fone invalido. Tente o cadastro novamente."
                                                            fErro
                                                        else do
                                                            if((length fone) /= 9)
                                                                then do
                                                                    putStrLn "Fone inválido. Tente o cadastro novamente."
                                                                    fErro
                                                                else do
                                                                    if(possuiLetra fone)
                                                                       then do
                                                                          putStrLn "Fone invalido. Tente o cadastro novamente."
                                                                          fErro
                                                                       else do
                                                                          putStrLn "Digite sua senha: "
                                                                          senha <- getLine
                                                                          if senha == ""
                                                                             then do
                                                                                putStrLn "Senha invalido. Tente o cadastro novamente."
                                                                                fErro
                                                                             else do
                                                                                putStrLn "Digite a sua senha novamente:"
                                                                                senha1 <- getLine
                                                                                if (senha1 /= senha)
                                                                                    then do
                                                                                        putStrLn "Senha diferente. Tente o cadastro novamente."
                                                                                        fErro
                                                                                else do
                                                                                        arq <- openFile "arquivos/usuarios/usuarios.txt" AppendMode
                                                                                        hPutStr arq (nome ++ " " ++ cpf ++ " " ++ fone ++ " " ++ senha ++ "\n")
                                                                                        hClose arq
            putStrLn "\n*******************************************************************\n\n"                                     

            

cpfCadast :: [String] -> [String]
cpfCadast [] = []
cpfCadast (a:as) = (elemento 1 (words a)):(cpfCadast as)

fErro :: IO()
fErro = do
    foo <- getLine
    putStrLn "\nDigite \n1- Cadastrar Novamente\n2- Menu"
    choose <- getChar
    if choose == '1'
       then do 
          cadastrar
       else do
           if choose == '2'
             then do return()
             else do 
               fErro

