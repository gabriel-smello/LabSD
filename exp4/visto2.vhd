-- Universidade de Brasilia
-- Laboratorio de Sistemas Digitais
-- Autor: Gabriel Henrique Souza de Melo - 180136577
-- Data: 08/10/2020


-- *******************************************************************
-- Circuito: Entidade com 7 bits de entrada e 1 saída para a função booleana S
--	     usando um decodificador, um multiplexador e 3 portas OU
--		S = FG+ABCD~E~FG+~A~B~C~D~E~FG+A~BCEF~G+~ABCD~EF~G+ABCDE~F~G+A~B~CDE~FG
--		A, B, C, D, E, F, G : Entradas
--		S = Saída
-- ********************************************************************

--Package (Pacote)
--constantes e bibliotecas
library IEEE;
use IEEE.std_logic_1164.all;

-- entity(entidade)
-- pinos de entradas e saidas
entity visto2 is port (
	A, B, C, D, E, F, G	: in std_logic;
	S			: out std_logic);
end visto2;

-- architecture (arquitetura)
-- implementacoes do projeto usando um multiplexador 8x1 de multiplexador8x1.vhd e um decodificador 4x16 de decodificador4x16.vhd
architecture main of visto2 is
	component multiplexador8x1 is
		port (
			sel : in std_logic_vector(2 downto 0);
			D : in std_logic_vector(7 downto 0);
			Y : out std_logic);
	end component;

	component decodificador4x16 is
		port (
			A : in std_logic_vector(3 downto 0);
			Y : out std_logic_vector(15 downto 0));
	end component;
--criacao dos sinais auxiliares para a interconexao ao processo de estimulo
signal i_sel : std_logic_vector(2 downto 0);
signal i_D : std_logic_vector(7 downto 0);
signal i_A : std_logic_vector(3 downto 0);
signal i_Y : std_logic_vector(15 downto 0);

begin
	i_A(0) <= D;
	i_A(1) <= C;
	i_A(2) <= B;
	i_A(3) <= A;
	i_sel(0) <= G;
	i_sel(1) <= F;
	i_sel(2) <= E;
	
	u0 : decodificador4x16 port map(i_A, i_Y);

	i_D(0) <= '0';
	i_D(1) <= i_Y(0) or i_Y(15);
	i_D(2) <= i_Y(7);
	i_D(3) <= '1';
	i_D(4) <= i_Y(9) or i_Y(15);
	i_D(5) <= '0';
	i_D(6) <= i_Y(10) or i_Y(11);
	i_D(7) <= '1';

	u1 : multiplexador8x1 port map(i_sel, i_D, S);
end main;


