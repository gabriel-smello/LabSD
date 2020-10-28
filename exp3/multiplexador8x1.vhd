-- Universidade de Brasilia
-- Laboratorio de Sistemas Digitais
-- Autor: Gabriel Henrique Souza de Melo - 180136577
-- Data: 24/09/2020

-- *******************************************************************
-- Circuito: multiplexador com 9 entradas(2 vetores entradas) e 1 saida:
--		S  entrada 1 que tera 3 bits informando qual das entradas D sera lida na saida(representa 1 entrada)
--		D  entrada 2 com 8 bits(representa 8 entradas)
--		Y saida
-- ********************************************************************

--Package (Pacote)
--constantes e bibliotecas
library IEEE;
use IEEE.std_logic_1164.all;

-- entity(entidade) de multiplexador 8x1
-- pinos de entradas e saidas
entity multiplexador8x1 is port (
	S : in std_logic_vector(2 downto 0);
	D : in std_logic_vector(7 downto 0);
	Y : out std_logic);
end multiplexador8x1;

-- architecture (arquitetura)
-- implementacoes do projeto multiplexador 8x1
architecture main of multiplexador8x1 is
-- definicao inicia por
begin
	Y <= 	D(0) when S = "000" else
		D(1) when S = "001" else
		D(2) when S = "010" else
		D(3) when S = "011" else
		D(4) when S = "100" else
		D(5) when S = "101" else
		D(6) when S = "110" else
		D(7);
end main;
-- definicao termina por end

