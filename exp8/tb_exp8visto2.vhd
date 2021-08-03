-- Universidade de Brasilia
-- Laboratorio de Sistemas Digitais
-- Autor: Gabriel Henrique Souza de Melo - 180136577
-- Data: 19/11/2020

-- *******************************************************************
-- Testbench para simulação funcional do
-- Circuito: compisição dos circuitos 'timeflags' e 'contador de modulo 100':
--		clock entrada 1
--		reset entrada 2
--		T60 saída sensivel ao tempo 60
--		T20 saida sensivel ao tempo 20
--		T6 saida sensivel ao tempo 6
-- 		T5 saida sensivel ao tempo 5
-- *************************

--entity (entidade) do testbench
--testbench92 uma entidade sem pinos de entradas e saidas
entity testbench92 is end;
--testbench para o circuito de exp8visto2.vhd
--validacao assincrona

--package (pacote)
--constantes e bibliotecas
library IEEE;
use IEEE.std_logic_1164.all;
use std.textio.all;

architecture tb_exp8visto2 of testbench92 is
--arquitetura para declaracao do componente exp8visto2, referente a sua arquitetura descrita no arquivo exp8visto2.vhd
component exp8visto2 is
	port( clock : in STD_LOGIC;
        reset : in STD_LOGIC;        
        T60 : out STD_LOGIC;
        T20 : out STD_LOGIC;
        T6 : out STD_LOGIC;
        T5 : out STD_LOGIC);
end component;

--criacao dos sinais auxiliares para a interconexao ao processo de estimulo
signal i_reset, i_clock : STD_LOGIC;
-- constantes para os sinais de clock
constant T : time := 10 ns;
begin

u0 : exp8visto2 port map(i_clock, i_reset, open, open, open, open);

clk : process
begin
	i_clock <= '0', '1' after T/2, '0' after T; wait for T;
end process;

estimulo : process
begin
	i_reset <= '0'; wait for 1200 ns;
	i_reset <= '1'; wait for 50 ns;
	i_reset <= '0'; wait for 500 ns;
	wait;
end process;
end;


