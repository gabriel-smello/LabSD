-- Universidade de Brasilia
-- Laboratorio de Sistemas Digitais
-- Autor: Gabriel Henrique Souza de Melo - 180136577
-- Data: 19/11/2020

-- *******************************************************************
-- Testbench para simulação funcional do
-- Circuito: Circuito que controla 2 semaforos de um cruzamento, de acordo com o tempo e os sensores de cada pista:
--		clock entrada 1
--		LD entrada 2
--		A entrada 3 (sensor A)
--		B entrada 4 (sensor B)
--		saidas dadas pela maquina de estado
-- ********************************************************************

--entity (entidade) do testbench
--testbench93 uma entidade sem pinos de entradas e saidas
entity testbench93 is end;
--testbench para o circuito de exp8visto3.vhd
--validacao assincrona

--package (pacote)
--constantes e bibliotecas
library IEEE;
use IEEE.std_logic_1164.all;
use std.textio.all;

architecture tb_exp8visto3 of testbench93 is
--arquitetura para declaracao do componente exp8visto3, referente a sua arquitetura descrita no arquivo exp8visto3.vhd
component exp8visto3 is
	port( clock : in STD_LOGIC;
        LD : in STD_LOGIC;        
        A : in STD_LOGIC;
        B : in STD_LOGIC);
end component;

--criacao dos sinais auxiliares para a interconexao ao processo de estimulo
signal i_clock, i_ld, i_A, i_B : STD_LOGIC := '0';
-- constantes para os sinais de clock
constant T : time := 10 ns;
begin

u0 : exp8visto3 port map(i_clock, i_ld, i_A, i_B);

clk : process
begin
	i_clock <= '0', '1' after T/2, '0' after T; wait for T;
end process;

estimulo : process
begin
	i_ld <= '1';
	wait for 1000 ns;
	i_A <= '1'; wait for 250 ns;
	i_B <= '1'; wait for 100 ns;
	wait;
end process;
end;


