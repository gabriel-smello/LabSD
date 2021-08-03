entity testbench62 is end;
--testbench para o circuito de visto2.vhd
--validacao assincrona

--package (pacote)
--constantes e bibliotecas
library IEEE;
use IEEE.std_logic_1164.all;
use std.textio.all;

architecture tb_regbi of testbench62 is
--arquitetura para declaracao do componente visto2, referente a sua arquitetura descrita no arquivo visto2.vhd
component regbi
	port(
	    CLK, RST, LOAD, DIR, L, R	: in std_logic;
	    D	: in std_logic_vector(3 downto 0);
	    Q	: out std_logic_vector(3 downto 0));
end component;
--criacao dos sinais auxiliares para a interconexao ao processo de estimulo
signal i_clk, i_rst, i_load, i_dir, i_l, i_r : std_logic;
signal i_d : std_logic_vector(3 downto 0) := (others => '0');
signal i_q : std_logic_vector(3 downto 0);
constant T : time := 2 ns;
begin

	u0 : regbi port map(i_clk, i_rst, i_load, i_dir, i_l, i_r, i_d, i_q);

clk1 : process
begin
i_clk <= '0','1' after T/2, '0' after T; wait for T;
end process;

processo : process
begin	
	i_rst <= '1'; i_load <= '1'; i_dir <= '0'; i_l <= '0'; i_r <= '0'; i_d <= "1111"; wait for 5 ns;
	i_rst <= '0'; i_load <= '1'; i_dir <= '0'; i_l <= '0'; i_r <= '0'; i_d <= "1111"; wait for 5 ns;
	i_rst <= '0'; i_load <= '0'; i_dir <= '0'; i_l <= '0'; i_r <= '0'; i_d <= "1111"; wait for 15 ns;
	i_rst <= '0'; i_load <= '0'; i_dir <= '1'; i_l <= '0'; i_r <= '1'; i_d <= "1111"; wait for 15 ns;
	i_rst <= '1'; i_load <= '0'; i_dir <= '1'; i_l <= '0'; i_r <= '1'; i_d <= "1111"; wait for 15 ns;
	wait;
end process;
end;

