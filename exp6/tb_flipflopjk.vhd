-- Universidade de Brasilia
-- Laboratorio de Sistemas Digitais
-- Autor: Gabriel Henrique Souza de Melo - 180136577
-- Data: 29/10/2020

-- *******************************************************************
-- Testbench para a simulação funcional do
-- Circuito: Flip-Flop JK de numeros binarios com 5 entradas e 1 saida:
--		PR entrada 1
--		CLR entrada 2
--		CLK entrada 3
--		J entrada 4
--		K entrada 5
--		Q saída
-- ********************************************************************

--entity (entidade) do testbench
--testbench61 uma entidade sem pinos de entradas e saidas
entity testbench61 is end;
--testbench para o circuito de flipflopjk.vhd
--validacao assincrona

--package (pacote)
--constantes e bibliotecas
library IEEE;
use IEEE.std_logic_1164.all;
use std.textio.all;

architecture tb_flipflopjk of testbench61 is
--arquitetura para declaracao do componente flipflopjk, referente a sua arquitetura descrita no arquivo flipflopjk.vhd
component flipflopjk
	port(
		PR, CLR, CLK, J, K	: in std_logic;
		Q			: out std_logic);
end component;
--criacao dos sinais auxiliares para a interconexao ao processo de estimulo
--constante para o sinal de clock
signal i_pr, i_clr, i_clk, i_j, i_k : std_logic;
constant T : time := 2 ns;
begin

	u0 : flipflopjk port map(i_pr, i_clr, i_clk, i_j, i_k, open);

clk1 : process
begin
i_clk <= '0','1' after T/2, '0' after T; wait for T;
end process;

processo : process
begin
	i_pr <= '0'; i_clr <= '1'; i_j <= '1'; i_k <= '1'; wait for 5 ns;
	i_pr <= '1'; i_clr <= '1'; i_j <= '1'; i_k <= '1'; wait for 5 ns;
	i_pr <= '0'; i_clr <= '0'; i_j <= '0'; i_k <= '0'; wait for 5 ns;
	i_pr <= '0'; i_clr <= '0'; i_j <= '0'; i_k <= '1'; wait for 5 ns;
	i_pr <= '0'; i_clr <= '0'; i_j <= '1'; i_k <= '0'; wait for 5 ns;
	i_pr <= '0'; i_clr <= '0'; i_j <= '1'; i_k <= '1'; wait for 5 ns;
	wait;
end process;
end;

