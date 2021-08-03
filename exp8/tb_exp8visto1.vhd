-- Universidade de Brasilia
-- Laboratorio de Sistemas Digitais
-- Autor: Gabriel Henrique Souza de Melo - 180136577
-- Data: 19/11/2020

-- *******************************************************************
-- Testbench para simulação funcional do
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

--entity (entidade) do testbench
--testbench91 uma entidade sem pinos de entradas e saidas
entity testbench91 is end;
--testbench para o circuito de exp8visto1.vhd
--validacao assincrona

--package (pacote)
--constantes e bibliotecas
library IEEE;
use IEEE.std_logic_1164.all;
use std.textio.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

architecture tb_exp8visto1 of testbench91 is
--arquitetura para declaracao do componente exp8visto1, referente a sua arquitetura descrita no arquivo exp8visto1.vhd
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

--criacao dos sinais auxiliares para a interconexao ao processo de estimulo
signal d1, d2, d3, d4, u1, u2, u3, u4 : STD_LOGIC;
signal i_clock, i_reset, i_enable, i_load : STD_LOGIC := '0';
-- contante para clock
constant T : time := 10 ns;

begin
u0 : exp8visto1 port map(clock => i_clock, reset => i_reset, enable => i_enable, load => i_load,
			 dezload(0) => d1, dezload(1) => d2, dezload(2) => d3, dezload(3) => d4,
			 uniload(0) => u1, uniload(1) => u2, uniload(2) => u3, uniload(3) => u4,
			 dezena => open, unidade => open);

clk : process
begin
	i_clock <= '0', '1' after T/2, '0' after T; wait for T;
end process;

estimulo : process
begin
	d1 <= '0';
	d2 <= '0';
	d3 <= '0';
	d4 <= '0';
	u1 <= '0';
	u2 <= '0';
	u3 <= '0';
	u4 <= '0';
	wait for 500 ns;

	i_enable <='0'; i_reset <= '0'; i_load <= '0'; wait for 500 ns;
	i_enable <= '1'; wait for 500 ns;
	i_enable <= '0'; wait for 250 ns;
	i_reset <= '1'; wait for 50 ns;
	i_reset <= '0'; wait for 500 ns;

	d1 <= '1';
	d2 <= '0';
	d3 <= '0';
	d4 <= '1';
	u1 <= '0';
	u2 <= '1';
	u3 <= '1';
	u4 <= '0';
	wait for 50 ns;
	i_load <= '1'; wait for 50 ns;
	i_load <= '0'; wait for 500 ns;
	wait;
end process;

end;


