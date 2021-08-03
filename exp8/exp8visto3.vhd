-- Universidade de Brasilia
-- Laboratorio de Sistemas Digitais
-- Autor: Gabriel Henrique Souza de Melo - 180136577
-- Data: 19/11/2020

-- *******************************************************************
-- Circuito: Circuito que controla 2 semaforos de um cruzamento, de acordo com o tempo e os sensores de cada pista:
--		clock entrada 1
--		LD entrada 2
--		A entrada 3 (sensor A)
--		B entrada 4 (sensor B)
--		saidas dadas pela maquina de estado
-- ********************************************************************

--Package
--Constantes e bibliotecas
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--entity
--pinos de entradas e saidas
entity exp8visto3 is
  port( clock : in STD_LOGIC;
        LD : in STD_LOGIC;        
        A : in STD_LOGIC;
        B : in STD_LOGIC);
end exp8visto3;

-- Arquitetura
architecture exp8visto3_arch of exp8visto3 is
-- Componente do contador de modulo 10
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
-- componente dos timeflags
component timeflags is  
        port( dezena : in STD_LOGIC_VECTOR(3 downto 0);
        unidade : in STD_LOGIC_VECTOR(3 downto 0);
        T60 : out STD_LOGIC;
        T20 : out STD_LOGIC;
        T6 : out STD_LOGIC;
        T5 : out STD_LOGIC );
end component;
-- componente da maquina de estados
component maquina is
         port( CLK, LD, A, B, T5, T6, T20, T60 : in STD_LOGIC;
         RYGsemaforoA, RYGsemaforoB: out STD_LOGIC_VECTOR(2 downto 0);
         Resetcontador: out STD_LOGIC);
end component;
-- criação de estado e sinais auxiliares para inteconexão ao processo de estimulo
signal i_reset, T60, T20, T6, T5: STD_LOGIC;
signal dezena, unidade: STD_LOGIC_VECTOR(3 downto 0);
signal RYGA, RYGB: STD_LOGIC_VECTOR(2 downto 0);

begin

u0 : exp8visto1 port map(clock, i_reset, '0', '0', "0000", "0000", dezena, unidade); 

u1: timeflags port map (dezena, unidade, T60, T20, T6, T5); 

u2 : maquina port map (clock, LD, A, B, T5, T6, T20, T60, RYGA, RYGB, i_reset);

end exp8visto3_arch;
