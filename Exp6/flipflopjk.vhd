-- Universidade de Brasilia
-- Laboratorio de Sistemas Digitais
-- Autor: Gabriel Henrique Souza de Melo - 180136577
-- Data: 29/10/2020

-- *******************************************************************
-- Circuito: Flip-Flop JK de numeros binarios com 5 entradas e 1 saida:
--		PR entrada 1
--		CLR entrada 2
--		CLK entrada 3
--		J entrada 4
--		K entrada 5
--		Q saída
-- ********************************************************************

--Package
--Constantes e bibliotecas
library IEEE;
use IEEE.std_logic_1164.all;

--entity
--pinos de entradas e saidas
entity flipflopjk is
	port(
		PR, CLR, CLK, J, K	: in std_logic;
		Q		: out std_logic);
end flipflopjk;

--achitecture
architecture main of flipflopjk is
--criacao dos sinais auxiliares para a interconexao ao processo de estimulo
	signal JK : std_logic_vector(1 downto 0);
	signal Qbuf : std_logic;
begin
 Q <= Qbuf;
 JK <= J & K;
-- processo que acontece se PR ou CLR ou CLK sofrer alguma alteração
process(PR, CLR,CLK)
begin
	if PR = '1' then Qbuf <= '1';
	elsif CLR = '1' then Qbuf <= '0';
	elsif rising_edge(CLK) then
		case JK is
		  when "00" => Qbuf <= Qbuf;
		  when "01" => Qbuf <= '0';
		  when "10" => Qbuf <= '1';
		  when "11" => Qbuf <= not(Qbuf);
		  when others => Qbuf <= Qbuf;
		end case;
	end if;
end process;
end;
