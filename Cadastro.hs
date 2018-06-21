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
            let listaNomes = lines contents
            putStrLn "Digite seu nome: "
            nome <- getLine
            if nome == ""
              then do
              putStrLn "Nome inválido. Tente o cadastro novamente."
              return()
            else do
              if (elem nome listaNomes)
                then do
                  putStrLn "Nome já existente. Tente o cadastro novamente."
                  return()
                  else do
                    if (possui nome)
                      then do
                        putStrLn "Nome não pode possuir número. Tente o cadastro novamente."
                        return()
                        else do
                          return ()
            putStrLn "Digite seu cpf: "
            cpf <- getLine
            if cpf == ""
              then do
              putStrLn "Cpf invalido. Tente o cadastro novamente."
              return()
            else do
              if((length cpf) /= 11)
                then do
                  putStrLn "Cpf inválido. Tente o cadastro novamente."
                  return()
              else do
                if(possuiLetra cpf)
                  then do
                    putStrLn "Cpf inválido. Tente o cadastro novamente."
                    return()
                else do
                  return()

            putStrLn "Digite seu Endereco: "
            endereco <- getLine
            if endereco == ""
              then do
              putStrLn "Error: Endereco invalido. Tente o cadastro novamente."
              return()
            else do
              return ()
            putStrLn "Digite seu telefone: "
            fone <- getLine
            if fone == ""
              then do
              putStrLn "Fone invalido. Tente o cadastro novamente."
              return()
            else do
              if((length fone) /= 9)
                then do
                putStrLn "Fone inválido. Tente o cadastro novamente."
                return()
              else do
                if(possuiLetra fone)
                  then do
                  putStrLn "Fone invalido. Tente o cadastro novamente."
                  return()
                else do
                  return ()
            putStrLn "Digite sua senha: "
            senha <- getLine
            if senha == ""
              then do
              putStrLn "Senha invalido. Tente o cadastro novamente."
              return()
            else do
              return ()
            putStrLn "Digite a sua senha novamente:"
            senha1 <- getLine
            if (senha1 /= senha)
              then do
                putStrLn "Senha diferente. Tente o cadastro novamente."
                return()
            else do
              return ()

            arq <- openFile "Teste.txt" AppendMode
            hPutStr arq "Cliente: \n"
            hPutStr arq ("Nome:" ++ "\n" ++ nome ++ "\n")
            hPutStr arq ("Cpf:\n" ++ cpf ++ "\n")
            hPutStr arq ("Endereço:\n" ++ endereco ++ "\n")
            hPutStr arq ("Fone:\n" ++ fone ++ "\n")
            hPutStr arq ("Senha:\n" ++ senha ++ "\n")
            hFlush arq
            hClose arq

