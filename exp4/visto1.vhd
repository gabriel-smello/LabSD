-- Universidade de Brasilia
-- Laboratorio de Sistemas Digitais
-- Autor: Gabriel Henrique Souza de Melo - 180136577
-- Data: 08/10/2020


-- *******************************************************************
-- Circuito: Entidade com 3 bits de entrada e 2 bits de saida, usando 2 multiplexadores
--		A, B e C : Entradas
--		X, Y : Saídas
-- ********************************************************************

--Package (Pacote)
--constantes e bibliotecas
library IEEE;
use IEEE.std_logic_1164.all;

-- entity(entidade)
-- pinos de entradas e saidas
entity visto1 is port (
	A, B, C	: in std_logic;
	X, Y	: out std_logic);
end visto1;

-- architecture (arquitetura)
-- implementacoes do projeto usando um multiplexador de multiplexador.vhd
architecture main of visto1 is
	component multiplexador is
		port (
			d0, d1, d2, d3 : in std_logic;
			sel : in std_logic_vector(1 downto 0);
			Y : out std_logic);
	end component;
--criacao dos sinais auxiliares para a interconexao ao processo de estimulo
signal not_C : std_logic;
signal SELECTOR : std_logic_vector(1 downto 0);

begin
	not_C <= not(C);
		SELECTOR(0) <= B;
		SELECTOR(1) <= A;
		u0: multiplexador port map('0', C, not_C, '1', SELECTOR, X);
		u1: multiplexador port map('1', not_C, '0', C, SELECTOR, Y); 

end main;
