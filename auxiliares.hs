module Auxiliares (
    elemento,
    index,
    possui,
    possuiLetra,
    rFloat,
    rInt
    ) where

import Data.List
import Data.Char

--Função que retorna o elemento de uma lista dado o indice
elemento :: Int -> [t] -> t
elemento _ [] = error "Lista vazia na funcao elemento"
elemento 0 (x:xs) = x
elemento a (x:xs) = elemento (a-1) xs 

--Função que retorna o indice do elemento em uma lista
index :: (Eq t)=> t -> [t] -> Int
index _ [] = error "Elemento não existe na lista da funçao index"
index e (l:ls) | e == l = 0
               | otherwise = 1 + (index e ls)

possui :: String -> Bool
possui [] = False
possui (a:as) |not $ isDigit a = possui as
              | otherwise = True

possuiLetra :: String -> Bool
possuiLetra [] = False
possuiLetra (a:as) | (isDigit a) = possuiLetra as
                   | otherwise = True

rFloat :: String -> Float
rFloat str = read str

rInt :: String -> Int
rInt str = read str