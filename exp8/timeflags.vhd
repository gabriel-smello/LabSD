-- Universidade de Brasilia
-- Laboratorio de Sistemas Digitais
-- Autor: Gabriel Henrique Souza de Melo - 180136577
-- Data: 19/11/2020

-- *******************************************************************
-- Circuito: Flags que ativam e desativam de acordo com o tempo:
--		dezena entrada 1
--		unidade entrada 2
--		T60 saída sensivel ao tempo 60
--		T20 saida sensivel ao tempo 20
--		T6 saida sensivel ao tempo 6
-- 		T5 saida sensivel ao tempo 5
-- *************************

--Package
--Constantes e bibliotecas
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entidade
entity timeflags is
  port( dezena : in STD_LOGIC_VECTOR(3 downto 0);
        unidade : in STD_LOGIC_VECTOR(3 downto 0);
        T60 : out STD_LOGIC;
        T20 : out STD_LOGIC;
        T6 : out STD_LOGIC;
        T5 : out STD_LOGIC );
end timeflags;

-- Arquitetura
architecture timeflags_arch of timeflags is

begin

T5 <= '1' when ( (dezena & unidade) >= x"05") else '0';

T6 <= '1' when ((dezena & unidade) >= x"06") else '0';

T20 <= '1' when ((dezena & unidade) >= x"20") else '0';

T60 <= '1' when ((dezena & unidade) >= x"60") else '0';
 

end timeflags_arch;
