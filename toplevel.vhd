library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD_UNSIGNED.all;

entity SinOrCos is
	port(
			clk, reset, sc, start: 	in STD_LOGIC;
			x:						in STD_LOGIC_VECTOR(15 downto 0);
			done:					out STD_LOGIC;
			r:						out STD_LOGIC_VECTOR(15 downto 0)
	);
end;

architecture sinOrCos1 of SinOrCos is
begin
	process(clk, sc, x, reset) begin
		if reset then
			r <= (others => '0');
			done <= '0';
		elsif rising_edge(clk) then
			if sc then
				r <= x - x^3/6 + x^5/120 - x^7/5040;
				done <= '1';
			else
				r <= 1 - x^2/2 + x^4/24 - x^6/720;
				done <= '1';
			end if;
		end if;
	end process;
end;