library IEEE; 
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD_UNSIGNED.all;

entity testbenchDivisor is
end;

architecture test of testbenchDivisor is
  component divisor
    port(
      numerator, denominator: in STD_LOGIC_VECTOR(31 downto 0);
      result: out STD_LOGIC_VECTOR(31 downto 0)
    );
  end component;
  signal sResult: STD_LOGIC_VECTOR(31 downto 0);
  signal clk: STD_LOGIC;
begin

  divisor1: divisor port map(
    "01011101111111101000000000000000",
    "00000001001110110000000000000000",
    sResult
  );

  process begin
    clk <= '1';
    wait for 5 ns; 
    clk <= '0';
    wait for 5 ns;
  end process;

  process(clk) begin
    if(rising_edge(clk)) then
      if(
        sResult = "00000000000000000011010000000000"
      ) then
        report "NO ERRORS: Simulation succeeded" severity failure;
      else
        report "Simulation failed" severity failure;
      end if;
    end if;
  end process;
end;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.fixed_float_types.all;
use work.fixed_pkg.all;

entity divisor is
  port (
    numerator, denominator: in STD_LOGIC_VECTOR(31 downto 0);
    result: out STD_LOGIC_VECTOR(31 downto 0)
  );
end divisor;

architecture divisor of divisor is
  signal numerator_fixed: sfixed(19 downto -12);
  signal denominator_fixed: sfixed(19 downto -12);
  signal sResult: sfixed(19 downto -12);
begin
  numerator_fixed <= to_sfixed(numerator, numerator_fixed);
  denominator_fixed <= to_sfixed(denominator, denominator_fixed);
  sResult <= numerator_fixed / denominator_fixed;
  result <= to_slv(sResult(38 downto 7));
end;
