-- Universidade de Brasilia
-- Laboratorio de Sistemas Digitais
-- Autor: Gabriel Henrique Souza de Melo - 180136577
-- Data: 10/09/2020


-- *******************************************************************
-- Testbench para simulacao funcional do
-- Circuito: Somador completo com 3 entradas e 2 saidas:
--		A entrada 1
--		B entrada 2
-- 		Cin entrada 3
--		S saida 1
--		Cout saida 2
-- ********************************************************************

--entity (entidade) do testbench
--testbench1 uma entidade sem pinos de entradas e saidas

entity testbench1 is end;

--testbench para o circuito de somador.vhd
--validacao assincrona

--package (pacote)
--constantes e bibliotecas

library IEEE;
use IEEE.std_logic_1164.all;
use std.textio.all;

architecture tb_somador of testbench1 is
--arquitetura para declaracao do componente somador, referente a sua arquitetura descrita no arquivo somador.vhd
component somador
port (
	A : in std_logic;
	B : in std_logic;
	Cin : in std_logic;
	S : out std_logic;
	Cout : out std_logic);
end component;

--sinais auxiliares para a interconexao ao processo de estimulos
signal i_A : std_logic;
signal i_B : std_logic;
signal i_C : std_logic;

-- instancia do componente somador e interconexao do componente ao processo de estimulo
begin
somador1: somador port map (A => i_A, B => i_B, Cin => i_C, S => open, Cout => open);

--implementacao do processo de estimulo
estimulo: process

begin
wait for 5 ns; i_A <= '0'; i_B <= '0'; i_C <= '0';
wait for 5 ns; i_C <= '1';
wait for 5 ns; i_B <= '1';
wait for 5 ns; i_C <= '0';
wait for 5 ns; i_A <= '1';
wait for 5 ns; i_C <= '1';
wait for 5 ns; i_B <= '0';
wait for 5 ns; i_C <= '0';
wait;

end process estimulo;
end ;
