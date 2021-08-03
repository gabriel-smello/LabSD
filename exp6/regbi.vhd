-- Universidade de Brasilia
-- Laboratorio de Sistemas Digitais
-- Autor: Gabriel Henrique Souza de Melo - 180136577
-- Data: 29/10/2020

-- *******************************************************************
-- Circuito: Registrador Bidirecional de 4 bits com reset síncrono e entrada paralela síncrona(7 entradas e 1 saída):
--		CLK entrada 1
--		RST entrada 2
--		LOAD entrada 3
--		D entrada 4(4 bits)
--		DIR entrada 5
--		L entrada 6
--		R entrada 7
--		Q saída
-- ********************************************************************

--Package
--Constantes e bibliotecas

--entity
--pinos de entradas e saidas
library IEEE;
use IEEE.std_logic_1164.all;

entity regbi is
	port(
	    CLK, RST, LOAD, DIR, L, R	: in std_logic;
	    D	: in std_logic_vector(3 downto 0);
	    Q	: out std_logic_vector(3 downto 0));
end regbi;
--achitecture
architecture main of regbi is
--criacao dos sinais auxiliares para a interconexao ao processo de estimulo
	signal Qbuf : std_logic_vector(3 downto 0);
begin
Q <= Qbuf;
-- processo que acontece se CLK sofrer alguma alteração
	process(CLK)
    	begin
        	if rising_edge(CLK) then
            		if RST = '1' then Qbuf <= "0000";
            		elsif RST = '0' and LOAD = '1' then Qbuf <= D;
            		elsif RST = '0' and LOAD = '0' then
               			if DIR = '0' then
                    			if L = '0' then Qbuf <= Qbuf(2) & Qbuf(1) & Qbuf(0) & '0';
                    			elsif L = '1' then Qbuf <= Qbuf(2) & Qbuf(1) & Qbuf(0) & '1';
                    			end if;
                		elsif DIR = '1' then
                    			if R = '0' then Qbuf <= '0' & Qbuf(3) & Qbuf(2) & Qbuf(1);
                    			elsif R = '1' then Qbuf <= '1' & Qbuf(3) & Qbuf(2) & Qbuf(1);
                    			end if;
               			end if;
            		end if;
        	end if;
	end process;
end main;
