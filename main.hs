{-  
    Projeto LPF - FoodFast
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
import Login
import Cadastro
import Cardapio


--função menu
main = do
       putStrLn "\n*******************************************************************\n"
       putStrLn "Bem-vindo ao aplicativo FastFlix! Realize a operação desejada:\n"
       putStrLn "1-Cadastro"
       putStrLn "2-Login e Cardapio"
       putStrLn "3-Fechar aplicativo\n\n"
       putStrLn "\n*******************************************************************\n\n"

       opcao <- getChar
       if opcao == ' '
         then return ()
         else do
           if opcao == '1'
             then do
               cadastrar
               main
             else do
               if opcao == '2'
                 then do
                   login
                   main
                 else do
                    if opcao == '3'
                        then do
                           return()
                        else do
                           main


