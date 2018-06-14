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
import Cardapio



--função menu
main = do
       putStrLn "Bem-vindo ao aplicativo FoodFast! Realize a operação desejada: "
       putStrLn "1-Cadastro"
       putStrLn "2-Login"
       putStrLn "3-Cardapio"
       putStrLn "4-Fechar aplicativo"
       opcao <- getChar
       if opcao == ' '
         then return ()
         else do
           if opcao == '1'
             then do
               --cadastro
               main
             else do
               if opcao == '2'
                 then do
                   --login
                   main
                 else do
                   if opcao == '3'
                    then do
                      mostrarCardapio
                      main
                    else return ()
