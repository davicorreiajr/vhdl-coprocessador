library IEEE; 
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD_UNSIGNED.all;

entity testbenchSubtractor is
end;

architecture test of testbenchSubtractor is
  component subtractor
    port(
      a, b: in  STD_LOGIC_VECTOR(31 downto 0);
      y:    out STD_LOGIC_VECTOR(31 downto 0)
    );
  end component;
  signal sResult: STD_LOGIC_VECTOR(31 downto 0);
  signal clk: STD_LOGIC;
begin

  subtractor1: subtractor port map(
    "00000000000000000000000000001001",
    "00000000000000000000000000000010",
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
        sResult = "00000000000000000000000000000111"
      ) then
        report "NO ERRORS: Simulation succeeded" severity failure;
      else
        report "Simulation failed" severity failure;
      end if;
    end if;
  end process;
end;

library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use IEEE.NUMERIC_STD_UNSIGNED.all;

entity subtractor is
  port(
    a, b: in  STD_LOGIC_VECTOR(31 downto 0);
    y:    out STD_LOGIC_VECTOR(31 downto 0)
  );
end;

architecture subtractor of subtractor is
begin
  y <= a + not b + '1';
end;
