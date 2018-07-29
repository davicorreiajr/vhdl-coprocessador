library IEEE; 
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD_UNSIGNED.all;

entity testbenchEprom is
end;

architecture testbenchEprom of testbenchEprom is
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
  signal sB1: STD_LOGIC_VECTOR(1 downto 0);
  signal sB2: STD_LOGIC_VECTOR(1 downto 0);
  signal sB3: STD_LOGIC_VECTOR(1 downto 0);
  signal sB4: STD_LOGIC_VECTOR(1 downto 0);
  signal sB5: STD_LOGIC;
  signal sB6: STD_LOGIC;
  signal sB7: STD_LOGIC_VECTOR(2 downto 0);
  signal sB8: STD_LOGIC_VECTOR(1 downto 0);
  signal sB9: STD_LOGIC;
  signal sB10: STD_LOGIC_VECTOR(1 downto 0);
  signal sEnableR1: STD_LOGIC;
  signal sEnableR2: STD_LOGIC;
  signal sEnableR3: STD_LOGIC;
  signal sEnableR4: STD_LOGIC;
  signal sEnableR5: STD_LOGIC;
  signal sEnableR: STD_LOGIC;
  signal sDone: STD_LOGIC;
begin

  eprom1: eprom port map(
    "1010", '1', '1',
    sB1, sB2, sB3, sB4, sB5, sB6, sB7, sB8, sB9, sB10,
    sEnableR1, sEnableR2, sEnableR3, sEnableR4, sEnableR5,
    sEnableR, sDone
  );

  process begin
    if(
      sB1 = "00" and
      sB2 = "10" and
      sB3 = "01" and
      sB4 = "11" and
      sB4 = "11" and
      sB5 = '1' and
      sB6 = '0' and
      sB7 = "001" and
      sB8 = "01" and
      sB9 = '0' and
      sB10 = "00" and
      sEnableR1 = '1' and
      sEnableR2 = '1' and
      sEnableR3 = '1' and
      sEnableR4 = '1' and
      sEnableR5 = '0' and
      sEnableR = '0' and
      sDone = '0'
    )
    then
      report "NO ERRORS: Simulation succeeded" severity failure;
    else
      report "Simulation failed" severity failure;
    end if;
  end process;
end;