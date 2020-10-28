-- Universidade de Brasilia
-- Laboratorio de Sistemas Digitais
-- Autor: Gabriel Henrique Souza de Melo - 180136577
-- Data: 15/10/2020


-- *******************************************************************
-- Testbench para simulacao funcional do
-- Circuito: Somador de numeros binarios com 2 entradas(4 bits cada) e 1 saida, usando 4 somadores completos:
--		A entrada 1
--		B entrada 2
--		S saida 1
-- ********************************************************************

--entity (entidade) do testbench
--testbench51 uma entidade sem pinos de entradas e saidas

entity testbench51 is end;

--testbench para o circuito de somador4b.vhd
--validacao assincrona

--package (pacote)
--constantes e bibliotecas

library IEEE;
use IEEE.std_logic_1164.all;
use std.textio.all;

architecture tb_somador4b of testbench51 is
--arquitetura para declaracao do componente somador4b, referente a sua arquitetura descrita no arquivo somador4b.vhd
component somador4b
port (
	A : in std_logic_vector(3 downto 0);
	B : in std_logic_vector(3 downto 0);
	S : out std_logic_vector(4 downto 0));
end component;

--sinais auxiliares para a interconexao ao processo de estimulos
signal i_A : std_logic_vector(3 downto 0);
signal i_B : std_logic_vector(3 downto 0);

-- instancia do componente somador4b e interconexao do componente ao processo de estimulo
begin
somador4b1: somador4b port map (i_A, i_B, open);

--implementacao do processo de estimulo
estimulo: process

begin
wait for 5 ns; i_A <= "1011"; i_B <= "1001";
wait for 5 ns; i_A <= "0000"; i_B <= "0000";
wait for 5 ns; i_A <= "1111"; i_B <= "1111";
wait for 5 ns; i_A <= "1010"; i_B <= "0101";

wait;

end process estimulo;
end ;

