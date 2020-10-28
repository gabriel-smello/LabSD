-- Universidade de Brasilia
-- Laboratorio de Sistemas Digitais
-- Autor: Gabriel Henrique Souza de Melo - 180136577
-- Data: 24/09/2020

-- *******************************************************************
-- Testbench para simulacao funcional do
-- Circuito: decodificador com 4 entradas(1 vetor entrada) e 16 saidas(1 vetor saida):
--		A  entrada 1 que tera 4 bits(representa 4 etnradas)
--		Y  saida
-- ********************************************************************

--entity (entidade) do testbench
--testbench32 uma entidade sem pinos de entradas e saidas
entity testbench32 is end;
--testbench para o circuito de decodificador4x16.vhd
--validacao assincrona

--package (pacote)
--constantes e bibliotecas
library IEEE;
use IEEE.std_logic_1164.all;
use std.textio.all;

architecture tb_decodificador4x16 of testbench32 is
--arquitetura para declaracao do componente decodificador4x16, referente a sua arquitetura descrita no arquivo decodificador4x16.vhd
component decodificador4x16
port (
	A : in std_logic_vector(3 downto 0);
	Y : out std_logic_vector(15 downto 0));
end component;

--criacao dos sinais auxiliares para a interconexao ao processo de estimulo
signal i_a : std_logic_vector(3 downto 0) := (others=>'0');
signal i_y : std_logic_vector(15 downto 0);

begin
decodificador1 : decodificador4x16 port map(A => i_a, Y => i_y);

i_a <= 	"0001" after 10 ns,
	"0011" after 20 ns,
	"0010" after 30 ns,
	"0110" after 40 ns,
	"0111" after 50 ns,
	"0101" after 60 ns,
	"0100" after 70 ns,
	"1100" after 80 ns,
	"1101" after 90 ns,
	"1111" after 100 ns,
	"1110" after 110 ns,
	"1010" after 120 ns,
	"1011" after 130 ns,
	"1001" after 140 ns,
	"1000" after 150 ns;
end;