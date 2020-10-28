-- Universidade de Brasilia
-- Laboratorio de Sistemas Digitais
-- Autor: Gabriel Henrique Souza de Melo - 180136577
-- Data: 24/09/2020

-- *******************************************************************
-- Circuito: decodificador com 4 entradas(1 vetor entrada) e 16 saidas(1 vetor saida):
--		A  entrada 1 que tera 4 bits(representa 4 etnradas)
--		Y  saida
-- ********************************************************************

--Package (Pacote)
--constantes e bibliotecas
library IEEE;
use IEEE.std_logic_1164.all;

-- entity(entidade) do decodificador 4x16
-- pinos de entradas e saidas
entity decodificador4x16 is port (
	A : in std_logic_vector(3 downto 0);
	Y : out std_logic_vector(15 downto 0));
end decodificador4x16;

-- architecture (arquitetura)
-- implementacoes do projeto decodificador 4x16
architecture main of decodificador4x16 is
-- definicao inicia por
begin
with A select
	y <= 	"0000000000000001" when "0000",
		"0000000000000010" when "0001",
		"0000000000000100" when "0010",
		"0000000000001000" when "0011",
		"0000000000010000" when "0100",
		"0000000000100000" when "0101",
		"0000000001000000" when "0110",
		"0000000010000000" when "0111",
		"0000000100000000" when "1000",
		"0000001000000000" when "1001",
		"0000010000000000" when "1010",
		"0000100000000000" when "1011",
		"0001000000000000" when "1100",
		"0010000000000000" when "1101",
		"0100000000000000" when "1110",
		"1000000000000000" when "1111",
		"0000000000000000" when others;
end main;
-- definicao termina por end
