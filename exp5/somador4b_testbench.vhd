-- Universidade de Brasilia
-- Laboratorio de Sistemas Digitais
-- Autor: Gabriel Henrique Souza de Melo - 180136577
-- Data: 15/10/2020

-- *******************************************************************
-- Circuito: Compara os resultados obtidos no DUT e no Golden Model:
--		s_dut entrada 1
--		s_gm entrada 2
--		A saida 1
--		B saida 2
-- Verificando todos os possiveis resultados comparados com um Golden Model, que utiliza a biblioteca IEEE.std_logic_arith
-- ********************************************************************

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

--entity
--pinos de entradas e saidas
entity somador4b_testbench is
    port(
	s_dut : in std_logic_vector (4 downto 0);
	s_gm : in std_logic_vector (4 downto 0);
	A, B : out std_logic_vector (3 downto 0));
end somador4b_testbench;

--arquitetura de somador4b_testbench para testar todos os resultados possiveis
architecture main of somador4b_testbench is 
begin
    process
        variable contbin: std_logic_vector(7 downto 0);
--mensagem no inicio do teste
    begin
        report "Iniciando teste" severity NOTE;

        contbin := "00000000";
--loop para testar todos as somas possiveis
        for i in 1 to 256 loop
            A <= contbin(7) & contbin(6) & contbin(5) & contbin(4);
            B <= contbin(3) & contbin(2) & contbin(1) & contbin(0);
            wait for 500 ns;
--mensagem e caso de erro
            assert(s_gm = s_dut) report "Falhou: i = " & integer'image(i) severity ERROR;
            
            contbin := contbin + 1;
        
        end loop;
--mensagem ao finalizar o teste
        report "Teste finalizado" severity NOTE;
    
        wait;
    end process;
end main;
