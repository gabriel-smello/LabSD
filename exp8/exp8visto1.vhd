-- Universidade de Brasilia
-- Laboratorio de Sistemas Digitais
-- Autor: Gabriel Henrique Souza de Melo - 180136577
-- Data: 19/11/2020

-- *******************************************************************
-- Circuito: Contador de 0 a 99 usando 2 contador10 em cascata:
--		clock entrada 1
--		reset entrada 2
--		enable entrada 3
--		load entrada 4
--		dezload entrada 5
--		uniload entrada 6
--		dezena saída 1
--		unidade saida 2	
-- *************************

--Package
--Constantes e bibliotecas
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entidade do contador de 0 a 99
entity exp8visto1 is
  port( clock : in STD_LOGIC;
        reset : in STD_LOGIC;        
        enable : in STD_LOGIC;
        load : in STD_LOGIC;
        dezload : in STD_LOGIC_VECTOR(3 downto 0);
        uniload : in STD_LOGIC_VECTOR(3 downto 0);
        dezena : out STD_LOGIC_VECTOR(3 downto 0);
        unidade : out STD_LOGIC_VECTOR(3 downto 0) );
end exp8visto1;

-- Arquitetura
architecture exp8visto1_arch of exp8visto1 is
--componente do contador10
component cont10 is
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           enable : in  STD_LOGIC;
           rci : in  STD_LOGIC;
           load : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR (3 downto 0);
           rco : out  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (3 downto 0));
end component; 
-- criação de estado e sinal auxiliar para inteconexão ao processo cont10
signal rcs: STD_LOGIC;

begin

u0: cont10 port map (clock, reset, enable, '0', load, uniload, rcs, unidade);

u1: cont10 port map (clock, reset, enable, rcs, load, dezload, open ,dezena);


end exp8visto1_arch;