-- Universidade de Brasilia
-- Laboratorio de Sistemas Digitais
-- Autor: Gabriel Henrique Souza de Melo - 180136577
-- Data: 15/10/2020


-- *******************************************************************
-- Circuito: Somador completo com 3 entradas e 2 saidas:
--		A entrada 1
--		B entrada 2
-- 		Cin entrada 3
--		S saida 1
--		Cout saida 2
-- ********************************************************************


--Package (Pacote)
--constantes e bibliotecas

library IEEE;
use IEEE.std_logic_1164.all;

-- entity(entidade) de somador completo
-- pinos de entradas e saidas

entity somador is port (
	X : in std_logic;
	Y : in std_logic;
	Cin : in std_logic;
	s : out std_logic;
	Cout : out std_logic);
end somador;

-- architecture (arquitetura)
-- implementacoes do projeto somador completo

architecture main of somador is
-- definicao inicia por
begin
-- S = f(A,B,Cin)
-- S = A xor B xor Cins
	s <= X xor Y xor Cin;
-- Cout = f(A,B,Cin)
-- Cout = AB + ACin + BCin
	Cout <= (X and Y) or (X and Cin) or (Y and Cin);
end main;
-- definicao termina por end