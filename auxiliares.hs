module Auxiliares (
    elemento,
    index
    ) where


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