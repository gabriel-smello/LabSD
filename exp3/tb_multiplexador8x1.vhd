-- Universidade de Brasilia
-- Laboratorio de Sistemas Digitais
-- Autor: Gabriel Henrique Souza de Melo - 180136577
-- Data: 24/09/2020

-- *******************************************************************
-- Testbench para simulacao funcional do
-- Circuito: multiplexador com 9 entradas(2 vetores entradas) e 1 saida:
--		S  entrada 1 que tera 3 bits informando qual das entradas D sera lida na saida(representa 1 entrada)
--		D  entrada 2 com 8 bits(representa 8 entradas)
--		Y saida
-- ********************************************************************

--entity (entidade) do testbench
--testbench31 uma entidade sem pinos de entradas e saidas
entity testbench31 is end;
--testbench para o circuito de multiplexador8x1.vhd
--validacao assincrona

--package (pacote)
--constantes e bibliotecas
library IEEE;
use IEEE.std_logic_1164.all;
use std.textio.all;

architecture tb_multiplexador8x1 of testbench31 is
--arquitetura para declaracao do componente multiplexador8x1, referente a sua arquitetura descrita no arquivo multiplexador8x1.vhd
component multiplexador8x1
port(
	S : in std_logic_vector(2 downto 0);
	D : in std_logic_vector(7 downto 0);
	Y : out std_logic);
end component;

--sinais auxiliares para a interconexao ao processo de estimulos e constantes para o clock
constant P : time:= 18 ns;
constant Q : time:= 16 ns;
constant R : time:= 14 ns;
constant S : time:= 12 ns;
constant T : time:= 10 ns;
constant U : time := 8 ns;
constant V : time := 6 ns;
constant X : time := 4 ns;
signal i_s : std_logic_vector(2 downto 0);
signal i_d : std_logic_vector(7 downto 0);

begin
multiplexador1 : multiplexador8x1 port map (S => i_s, D => i_d, Y => open);


--criacao de clocks e processo da celula que indica endereco
clk1 : process
begin
i_d(0) <= '0','1' after P/2, '0' after P; wait for P;
end process;

clk2 : process
begin
i_d(1) <= '0','1' after Q/2, '0' after Q; wait for Q;
end process;

clk3 : process
begin
i_d(2) <= '0','1' after R/2, '0' after R; wait for R;
end process;

clk4 : process
begin
i_d(3) <= '0','1' after S/2, '0' after S; wait for S;
end process;

clk5 : process
begin
i_d(4) <= '0','1' after T/2, '0' after T; wait for T;
end process;

clk6 : process
begin
i_d(5) <= '0','1' after U/2, '0' after U; wait for U;
end process;

clk7 : process
begin
i_d(6) <= '0','1' after V/2, '0' after V; wait for V;
end process;

clk8 : process
begin
i_d(7) <= '0','1' after X/2, '0' after X; wait for X;
end process;

processo:process
begin
i_s <= "000"; wait for 100 ns;
i_s <= "001"; wait for 100 ns;
i_s <= "011"; wait for 100 ns;
i_s <= "010"; wait for 100 ns;
i_s <= "110"; wait for 100 ns;
i_s <= "111"; wait for 100 ns;
i_s <= "101"; wait for 100 ns;
i_s <= "100"; wait for 100 ns;
wait;
end process;
end;
