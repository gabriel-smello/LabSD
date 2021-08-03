-- Universidade de Brasilia
-- Laboratorio de Sistemas Digitais
-- Autor: Gabriel Henrique Souza de Melo - 180136577
-- Data: 19/11/2020

-- *******************************************************************
-- Circuito: compisição dos circuitos 'timeflags' e 'contador de modulo 100':
--		clock entrada 1
--		reset entrada 2
--		T60 saída sensivel ao tempo 60
--		T20 saida sensivel ao tempo 20
--		T6 saida sensivel ao tempo 6
-- 		T5 saida sensivel ao tempo 5
-- *************************

--Package
--Constantes e bibliotecas
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--entidade do circuito
entity exp8visto2 is
  port( clock : in STD_LOGIC;
        reset : in STD_LOGIC;        
        T60 : out STD_LOGIC;
        T20 : out STD_LOGIC;
        T6 : out STD_LOGIC;
        T5 : out STD_LOGIC);
end exp8visto2;
-- Arquitetura
architecture exp8visto2_arch of exp8visto2 is
-- Componente de timeflags
component timeflags is
  port( dezena : in STD_LOGIC_VECTOR(3 downto 0);
        unidade : in STD_LOGIC_VECTOR(3 downto 0);
        T60 : out STD_LOGIC;
        T20 : out STD_LOGIC;
        T6 : out STD_LOGIC;
        T5 : out STD_LOGIC );
end component; 
-- Componente do circuito 'contador de modulo 100'
component exp8visto1 is
  port( clock : in STD_LOGIC;
        reset : in STD_LOGIC;        
        enable : in STD_LOGIC;
        load : in STD_LOGIC;
        dezload : in STD_LOGIC_VECTOR(3 downto 0);
        uniload : in STD_LOGIC_VECTOR(3 downto 0);
        dezena : out STD_LOGIC_VECTOR(3 downto 0);
        unidade : out STD_LOGIC_VECTOR(3 downto 0) );
end component; 
-- criação de estado e sinais auxiliares para inteconexão ao processo de estimulo
signal dezena, unidade: STD_LOGIC_VECTOR(3 downto 0);

begin

u0: exp8visto1 port map (clock, reset, '0', '0', x"0", x"0", dezena, unidade);

u1: timeflags port map (dezena, unidade, T60, T20, T6, T5); 

end exp8visto2_arch;