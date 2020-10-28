-- Universidade de Brasilia
-- Laboratorio de Sistemas Digitais
-- Autor: Gabriel Henrique Souza de Melo - 180136577
-- Data: 15/10/2020

-- *******************************************************************
-- Top Module para simulacao funcional do
-- Circuito: Somador de numeros binarios com 2 entradas(4 bits cada) e 1 saida, usando 4 somadores completos:
--		A entrada 1
--		B entrada 2
--		S saida 1
-- Usando um testbench para verificar todos os possiveis resultados comparados com um Golden Model, que utiliza a biblioteca IEEE.std_logic_arith
-- ********************************************************************

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

--entity (entidade) do top module
--somador4b_topmodule uma entidade sem pinos de entradas e saidas
entity somador4b_topmodule is end;

--top module para o circuito de somador4b.vhd
--validacao assincrona

--package (pacote)
--constantes e bibliotecas

--arquitetura para declaracao dos componentes
architecture main of somador4b_topmodule is 
--componente somador4b, referente a sua arquitetura descrita no arquivo somador4b.vhd
    component somador4b is
        port(
		A : in std_logic_vector(3 downto 0);
		B : in std_logic_vector(3 downto 0);
            	S : out std_logic_vector(4 downto 0));
    end component;
--componente somador4b_testbench, referente a sua arquitetura descrita no arquivo somador4b_testbench.vhd
    component somador4b_testbench is
        port(
		s_dut : in std_logic_vector (4 downto 0);
		s_gm : in std_logic_vector (4 downto 0);
		A, B : out std_logic_vector (3 downto 0));
    end component;    
--componente somador4b_goldenmodel, referente a sua arquitetura descrita no arquivo somador4b_goldenmodel.vhd
    component somador4b_goldenmodel is
        port(
		A : in std_logic_vector(3 downto 0);
		B : in std_logic_vector(3 downto 0);
            	S : out std_logic_vector(4 downto 0));
    end component;
    
--sinais auxiliares para a interconexao ao processo de estimulos
    signal A, B: std_logic_vector(3 downto 0);
    signal s_dut, s_gm: std_logic_vector(4 downto 0) := (others => '0');

-- instancia dos componente somador4b, somador4b_goldenmodel e somador4b_testbench
begin
    U0: somador4b port map(A,B, s_dut);
    U1: somador4b_goldenmodel port map(A, B, s_gm);
    U2: somador4b_testbench port map(s_dut, s_gm, A, B);

end main;
