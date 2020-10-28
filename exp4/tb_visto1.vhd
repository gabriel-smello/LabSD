-- Universidade de Brasilia
-- Laboratorio de Sistemas Digitais
-- Autor: Gabriel Henrique Souza de Melo - 180136577
-- Data: 08/10/2020


-- *******************************************************************
-- Testbench para simulacao funcional do
-- Circuito: Entidade com 3 bits de entrada e 2 bits de saida, usando 2 multiplexadores
--		A, B e C : Entradas
--		X, Y : Saídas
-- ********************************************************************

--entity (entidade) do testbench
--testbench41 uma entidade sem pinos de entradas e saidas

entity testbench41 is end;
--testbench para o circuito de visto1.vhd
--validacao assincrona

--package (pacote)
--constantes e bibliotecas
library IEEE;
use IEEE.std_logic_1164.all;
use std.textio.all;

architecture tb_visto1 of testbench41 is
--arquitetura para declaracao do componente visto1, referente a sua arquitetura descrita no arquivo visto1.vhd
component visto1
port (
	A, B, C	: in std_logic;
	X, Y	: out std_logic);
end component;

--criacao dos sinais auxiliares para a interconexao ao processo de estimulo
signal i_a, i_b, i_c : std_logic;

begin
	u1: visto1 port map(i_a, i_b, i_c, open, open);


estimulo : process
begin
	wait for 5 ns; i_a <= '0'; i_b <= '0'; i_c <= '0';
	wait for 5 ns; i_a <= '0'; i_b <= '0'; i_c <= '1';
	wait for 5 ns; i_a <= '0'; i_b <= '1'; i_c <= '0';
	wait for 5 ns; i_a <= '0'; i_b <= '1'; i_c <= '1';
	wait for 5 ns; i_a <= '1'; i_b <= '0'; i_c <= '0';
	wait for 5 ns; i_a <= '1'; i_b <= '0'; i_c <= '1';
	wait for 5 ns; i_a <= '1'; i_b <= '1'; i_c <= '0';
	wait for 5 ns; i_a <= '1'; i_b <= '1'; i_c <= '1';
	wait;
end process;
end;

