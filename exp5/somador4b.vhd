-- Universidade de Brasilia
-- Laboratorio de Sistemas Digitais
-- Autor: Gabriel Henrique Souza de Melo - 180136577
-- Data: 15/10/2020

-- *******************************************************************
-- Circuito: Somador de numeros binarios com 2 entradas(4 bits cada) e 1 saida, usando 4 somadores completos:
--		A entrada 1
--		B entrada 2
--		S saida 1
-- ********************************************************************

--Package
--Constantes e bibliotecas
library IEEE;
use IEEE.std_logic_1164.all;

--entity
--pinos de entradas e saidas
entity somador4b is
	port(
		A : in std_logic_vector(3 downto 0);
		B : in std_logic_vector(3 downto 0);
		S : out std_logic_vector(4 downto 0));
end somador4b;

--achitecture
--implementacoes do projeto usando somador completo de somador.vhd
architecture main of somador4b is
	component somador is
	port (
		X : in std_logic;
		Y : in std_logic;
		Cin : in std_logic;
		s : out std_logic;
		Cout : out std_logic);
	end component;
--criacao dos sinais auxiliares para a interconexao ao processo de estimulo		
signal fio1, fio2, fio3 : std_logic;

begin
	u0 : somador port map(A(0), B(0), '0', s(0), fio1);
	u1 : somador port map(A(1), B(1), fio1, s(1), fio2);
	u3 : somador port map(A(2), B(2), fio2, s(2), fio3);
	u4 : somador port map(A(3), B(3), fio3, s(3), S(4));
end;