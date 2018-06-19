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
       putStrLn "\n\nBem-vindo ao aplicativo FoodFast! Realize a operação desejada:\n"
       putStrLn "1-Cadastro"
       putStrLn "2-Cardapio"
       putStrLn "3-Fechar aplicativo\n\n"
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
                 else return ()


