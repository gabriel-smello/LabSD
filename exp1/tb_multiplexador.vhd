-- Universidade de Brasilia
-- Laboratorio de Sistemas Digitais
-- Autor: Gabriel Henrique Souza de Melo - 180136577
-- Data: 10/09/2020


-- *******************************************************************
-- Testbench para simulacao funcional do
-- Circuito: multiplexador com 5 entradas e 1 saidas:
--		sel entrada 1 que tera 2 bits informando qual das entradas D sera lida na saida
--		d0 entrada 2
-- 		d1 entrada 3
--		d2 entrada 4
--		d3 entrada 5
--		y saida
-- ********************************************************************

--entity (entidade) do testbench
--testbench2 uma entidade sem pinos de entradas e saidas

entity testbench2 is end;

--testbench para o circuito de multiplexador.vhd
--validacao assincrona

--package (pacote)
--constantes e bibliotecas

library IEEE;
use IEEE.std_logic_1164.all;
use std.textio.all;

architecture tb_multiplexador of testbench2 is
--arquitetura para declaracao do componente somador, referente a sua arquitetura descrita no arquivo multiplexador.vhd
component multiplexador
port (
	sel : in std_logic_vector(1 downto 0);
	d0, d1, d2, d3 : in std_logic;
	y : out std_logic);
end component;

--sinais auxiliares para a interconexao ao processo de estimulos e constantes para o clock
signal i_sel : std_logic_vector(1 downto 0);
signal i_d0, i_d1, i_d2, i_d3 : std_logic;
constant T : time := 10 ns;
constant U : time := 8 ns;
constant V : time := 6 ns;
constant X : time := 4 ns;
begin
multiplexador1 : multiplexador port map (sel => i_sel, d0 => i_d0, d1 => i_d1, d2 => i_d2, d3 => i_d3, y => open);

clk1 : process
begin
i_d0 <= '0','1' after T/2, '0' after T; wait for T;
end process;

clk2 : process
begin
i_d1 <= '0','1' after U/2, '0' after U; wait for U;
end process;

clk3 : process
begin
i_d2 <= '0','1' after V/2, '0' after V; wait for V;
end process;

clk4 : process
begin
i_d3 <= '0','1' after X/2, '0' after X; wait for X;
end process;

processo:process
begin
i_sel <= "00"; wait for 30 ns;
i_sel <= "01"; wait for 30 ns;
i_sel <= "11"; wait for 30 ns;
i_sel <= "10"; wait for 30 ns;
wait;
end process;

end ;
