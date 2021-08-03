-- Universidade de Brasilia
-- Laboratorio de Sistemas Digitais
-- Autor: Gabriel Henrique Souza de Melo - 180136577
-- Data: 05/11/2020

-- *******************************************************************
-- Testbench para a simulação funcional do
-- Circuito: Máquina de refrigerante que depende das entradas(incluindo o clock) podendo gerar diversas saídas, como o próprio refrigerante e os possiveis trocos:
--		clock entrada 1
--		reset entrada 2
--		A entrada 3 (2 bits)
--		R saída 1 - refrigerante
--		V saída 2 Vinte e cinco centavos
--		C saída 5 Cinquenta centavos
-- ********************************************************************

--entity (entidade) do testbench
--testbench7 uma entidade sem pinos de entradas e saidas
entity testbench7 is end;
--testbench para o circuito de maquina_refri.vhd
--validacao assincrona

--package (pacote)
--constantes e bibliotecas
library IEEE;
use IEEE.std_logic_1164.all;
use std.textio.all;

architecture tb_maquina_refri of testbench7 is
--arquitetura para declaracao do componente maquina_refri, referente a sua arquitetura descrita no arquivo maquina_refri.vhd
component maquina_refri is
	port(
	clock, reset : in STD_LOGIC;
        A : in STD_LOGIC_VECTOR(1 downto 0);
        R, V, C : out STD_LOGIC);
end component;

--criacao dos sinais auxiliares para a interconexao ao processo de estimulo
signal clk_a0, clk_a1, clk_clk, clk_reset : std_logic := '0';
signal aux_a : std_logic_vector(1 downto 0) := (others => '0');
-- constantes para os sinais de clock
constant T : time := 1 ns;
constant U : time := 30 ns;
constant X : time := 15 ns;
constant V : time := 60 ns;

begin

	aux_a <= clk_a1 & clk_a0;
	u0 : maquina_refri port map(A => aux_a, clock => clk_clk, reset => clk_reset, R => open, V => open, C => open);

clk1 : process
begin
clk_clk <= '0','1' after T/2, '0' after T; wait for T;
end process;

clk2 : process
begin
clk_a1 <= '0','1' after U/2, '0' after U; wait for U;
end process;

clk21 : process
begin
clk_a0 <= '0','1' after X/2, '0' after X; wait for X;
end process;

clk3: process
begin
clk_reset <= '0', '1' after V/2, '0' after V; wait for V;
end process;

end;

