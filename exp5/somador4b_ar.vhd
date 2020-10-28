-- Universidade de Brasilia
-- Laboratorio de Sistemas Digitais
-- Autor: Gabriel Henrique Souza de Melo - 180136577
-- Data: 15/10/2020

-- *******************************************************************
-- Circuito: Somador de numeros binarios com 2 entradas(4 bits cada) e 1 saida, usando a biblioteca IEEE.std_logic_arith:
--		A entrada 1
--		B entrada 2
--		S saida 1
-- ********************************************************************

--Package
--Constantes e bibliotecas
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

--entity
--pinos de entradas e saidas
entity somador4b_ar is
	port(
		A : in std_logic_vector(3 downto 0);
		B : in std_logic_vector(3 downto 0);
		S : out std_logic_vector(4 downto 0));
end somador4b_ar;

--achitecture
--implementacoes do projeto usando funcoes da biblioteca IEEE.std_logic_arith
architecture main of somador4b_ar is
begin
	S <= ('0' & unsigned(A)) + ('0' & unsigned(B));
end;