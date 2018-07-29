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
  signal sResult: STD_LOGIC_VECTOR(31 downto 0)
  signal clk: STD_LOGIC;
begin

  divisor1: divisor port map(
    "00000000000000001100100000000000",
    "00000000000000000010000000000000",
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