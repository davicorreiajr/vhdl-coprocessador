library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity coprocessor is
  port (
    x: in STD_LOGIC_VECTOR(15 downto 0);
    sc: in STD_LOGIC;
    start: in STD_LOGIC;
    reset: in STD_LOGIC;
    clock: in STD_LOGIC;
    r: out STD_LOGIC_VECTOR(15 downto 0);
    done: out STD_LOGIC
  );
end coprocessor;

architecture coprocessor of coprocessor is

  component unitControl
    port(
      start: in STD_LOGIC;
      reset: in STD_LOGIC;
      clock: in STD_LOGIC;
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

  component datapath
    port(
      x: in STD_LOGIC_VECTOR(15 downto 0);
      clock: in STD_LOGIC;
      reset: in STD_LOGIC;
      b1: in STD_LOGIC_VECTOR(1 downto 0);
      b2: in STD_LOGIC_VECTOR(1 downto 0);
      b3: in STD_LOGIC_VECTOR(1 downto 0);
      b4: in STD_LOGIC_VECTOR(1 downto 0);
      b5: in STD_LOGIC;
      b6: in STD_LOGIC;
      b7: in STD_LOGIC_VECTOR(2 downto 0);
      b8: in STD_LOGIC_VECTOR(1 downto 0);
      b9: in STD_LOGIC;
      b10: in STD_LOGIC_VECTOR(1 downto 0);
      enableR1: in STD_LOGIC;
      enableR2: in STD_LOGIC;
      enableR3: in STD_LOGIC;
      enableR4: in STD_LOGIC;
      enableR5: in STD_LOGIC;
      enableR: in STD_LOGIC;
      r: out STD_LOGIC_VECTOR(15 downto 0)
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
  signal sR: STD_LOGIC_VECTOR(1 downto 0);
begin

  uc1: unitControl port map(
    start, reset, clock, sc,
    sB1, sB2, sB3, sB4, sB5, sB6, sB7, sB8, sB9, sB10,
    sEnableR1, sEnableR2, sEnableR3, sEnableR4, sEnableR5, sEnableR,
    sDone
  );

  datapath1: datapath port map(
    x, clock, reset,
    sB1, sB2, sB3, sB4, sB5, sB6, sB7, sB8, sB9, sB10,
    sEnableR1, sEnableR2, sEnableR3, sEnableR4, sEnableR5, sEnableR,
    sR
  );

  done <= sDone;
  r <= sR;
end;
