-- Universidade de Brasilia
-- Laboratorio de Sistemas Digitais
-- Autor: Gabriel Henrique Souza de Melo - 180136577
-- Data: 10/09/2020


-- *******************************************************************
-- Circuito: multiplexador com 5 entradas e 1 saidas:
--		sel entrada 1 que tera 2 bits informando qual das entradas D sera lida na saida
--		d0 entrada 2
-- 		d1 entrada 3
--		d2 entrada 4
--		d3 entrada 5
--		y saida
-- ********************************************************************

library IEEE;
use IEEE.std_logic_1164.all;

entity multiplexador is port (
	sel : in std_logic_vector(1 downto 0);
	d0, d1, d2, d3 : in std_logic;
	y : out std_logic);
end multiplexador;

architecture main of multiplexador is
signal f1, f2, f3, f4 : std_logic;

begin
	f1 <= (d0 and (not sel(1) and not sel(0) ));
	f2 <= (d1 and ((not sel(1)) and (sel(0))));
	f3 <= (d2 and ((sel(1)) and (not sel(0))));
	f4 <= (d3 and ((sel(1)) and (sel(0))));

	y <= f1 or f2 or f3 or f4;
end main;
