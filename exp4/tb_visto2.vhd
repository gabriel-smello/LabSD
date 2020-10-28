-- Universidade de Brasilia
-- Laboratorio de Sistemas Digitais
-- Autor: Gabriel Henrique Souza de Melo - 180136577
-- Data: 08/10/2020


-- *******************************************************************
-- Testbench para simulacao funcional do
-- Circuito: Entidade com 7 bits de entrada e 1 saída para a função booleana S
--	     usando um decodificador, um multiplexador e 3 portas OU
--		S = FG+ABCD~E~FG+~A~B~C~D~E~FG+A~BCEF~G+~ABCD~EF~G+ABCDE~F~G+A~B~CDE~FG
--		A, B, C, D, E, F, G : Entradas
--		S = Saída
-- ********************************************************************
--entity (entidade) do testbench
--testbench42 uma entidade sem pinos de entradas e saidas

entity testbench42 is end;
--testbench para o circuito de visto2.vhd
--validacao assincrona

--package (pacote)
--constantes e bibliotecas
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

architecture tb_visto2 of testbench42 is
--arquitetura para declaracao do componente visto2, referente a sua arquitetura descrita no arquivo visto2.vhd
component visto2
port (
	A, B, C, D, E, F, G	: in std_logic;
	S			: out std_logic);
end component;
--criacao dos sinais auxiliares para a interconexao ao processo de estimulo
signal i_entrada : std_logic_vector(6 downto 0) := (others => '0');

begin

	u0 : visto2 port map(i_entrada(6), i_entrada(5), i_entrada(4), i_entrada(3), i_entrada(2), i_entrada(1), i_entrada(0), open);

estimulo:process
begin
	for I in 0 to 127 loop
		wait for 5 ns; i_entrada <= std_logic_vector(to_unsigned(to_integer(unsigned(i_entrada)) + 1, 7));
	end loop;
	wait;
end process;
end;

