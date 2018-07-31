library IEEE; 
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD_UNSIGNED.all;

entity testbenchMultiplier is
end;

architecture test of testbenchMultiplier is
  component multiplier
    port(
      multiplier, multiplicand: in STD_LOGIC_VECTOR(31 downto 0);
      result: out STD_LOGIC_VECTOR(31 downto 0)
    );
  end component;
  signal sResult: STD_LOGIC_VECTOR(31 downto 0);
  signal clk: STD_LOGIC;
begin

  multiplier1: multiplier port map(
    "00000000000000000000000000000000",
    "00000000000000000000000000000000",
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
        sResult = "00000000000000000000000000000000"
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

entity multiplier is
  port (
    multiplier, multiplicand: in STD_LOGIC_VECTOR(31 downto 0);
    result: out STD_LOGIC_VECTOR(31 downto 0)
  );
end multiplier;

architecture multiplier of multiplier is
  signal multiplier_fixed: sfixed(19 downto -12);
  signal multiplicand_fixed: sfixed(19 downto -12);
  signal sResult: sfixed(32 downto -31);
begin
  multiplier_fixed <= to_sfixed(multiplier, multiplier_fixed);
  multiplicand_fixed <= to_sfixed(multiplicand, multiplicand_fixed);
  sResult <= multiplier_fixed * multiplicand_fixed;
  result <= to_slv(sResult(19 downto -12));
end;
