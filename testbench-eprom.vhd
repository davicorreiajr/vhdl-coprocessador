library IEEE; 
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD_UNSIGNED.all;

entity testbenchEprom is
end;

architecture test of testbenchEprom is
  component eprom
    port(
      currentState: in STD_LOGIC_VECTOR(3 downto 0);
      start: in STD_LOGIC;
      sc: in STD_LOGIC;
      b1: out STD_LOGIC_VECTOR(1 downto 0);
      b2: out STD_LOGIC_VECTOR(1 downto 0);
      b3: out STD_LOGIC_VECTOR(1 downto 0);
      b4: out STD_LOGIC_VECTOR(1 downto 0);
      b5: out STD_LOGIC;
      b6: out STD_LOGIC;
      b7: out STD_LOGIC_VECTOR(2 downto 0);
      b8: out STD_LOGIC_VECTOR(1 downto 0);
      b9: out STD_LOGIC;
      b10: out STD_LOGIC_VECTOR(1 downto 0);
      enableR1: out STD_LOGIC;
      enableR2: out STD_LOGIC;
      enableR3: out STD_LOGIC;
      enableR4: out STD_LOGIC;
      enableR5: out STD_LOGIC;
      enableR: out STD_LOGIC;
      done: out STD_LOGIC
    );
  end component;
  signal b1: STD_LOGIC_VECTOR(1 downto 0);
  signal b2: STD_LOGIC_VECTOR(1 downto 0);
  signal b3: STD_LOGIC_VECTOR(1 downto 0);
  signal b4: STD_LOGIC_VECTOR(1 downto 0);
  signal b5: STD_LOGIC;
  signal b6: STD_LOGIC;
  signal b7: STD_LOGIC_VECTOR(2 downto 0);
  signal b8: STD_LOGIC_VECTOR(1 downto 0);
  signal b9: STD_LOGIC;
  signal b10: STD_LOGIC_VECTOR(1 downto 0);
  signal enableR1: STD_LOGIC;
  signal enableR2: STD_LOGIC;
  signal enableR3: STD_LOGIC;
  signal enableR4: STD_LOGIC;
  signal enableR5: STD_LOGIC;
  signal enableR: STD_LOGIC;
  signal done: STD_LOGIC
begin

  eprom: eprom port map(
    "1010", '1', '1',
    b1, b2, b3, b4, b5, b6, b7, b8, b9, b10,
    enableR1, enableR2, enableR3, enableR4, enableR5,
    enableR, done
  );

  process begin
    if(
      b1 = "00",
      b2 = "10",
      b3 = "01",
      b4 = "11",
      b4 = "11",
      b5 = '1',
      b6 = '0',
      b7 = "001",
      b8 = "01",
      b9 = '0',
      b10 = "00",
      enableR1 = '1',
      enableR2 = '1',
      enableR3 = '1',
      enableR4 = '1',
      enableR5 = '0',
      enableR = '0',
      done = '0',
    ) then
      report "NO ERRORS: Simulation succeeded" severity failure;
    else
      report "Simulation failed" severity failure;
    end if;
  end process;
end;