library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity datapath is
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
end datapath;

architecture datapath of datapath is

  component regs
    port(
      clock, enable, clear: in STD_LOGIC;
      in1: in STD_LOGIC_VECTOR(31 downto 0);
      out1: out STD_LOGIC_VECTOR(31 downto 0)
    );
  end component;

  component bus2in
    port(
      in1: in STD_LOGIC_VECTOR(31 downto 0);
      in2: in STD_LOGIC_VECTOR(31 downto 0);
      control: in STD_LOGIC;
      out1: out STD_LOGIC_VECTOR(31 downto 0)
    );
  end component;

  component bus3in
    port(
      in1: in STD_LOGIC_VECTOR(31 downto 0);
      in2: in STD_LOGIC_VECTOR(31 downto 0);
      in3: in STD_LOGIC_VECTOR(31 downto 0);
      control: in STD_LOGIC_VECTOR(1 downto 0);
      out1: out STD_LOGIC_VECTOR(31 downto 0)
    );
  end component;

  component bus4in
    port(
      in1: in STD_LOGIC_VECTOR(31 downto 0);
      in2: in STD_LOGIC_VECTOR(31 downto 0);
      in3: in STD_LOGIC_VECTOR(31 downto 0);
      in4: in STD_LOGIC_VECTOR(31 downto 0);
      control: in STD_LOGIC_VECTOR(1 downto 0);
      out1: out STD_LOGIC_VECTOR(31 downto 0)
    );
  end component;

  component bus7in
    port(
      in1: in STD_LOGIC_VECTOR(31 downto 0);
      in2: in STD_LOGIC_VECTOR(31 downto 0);
      in3: in STD_LOGIC_VECTOR(31 downto 0);
      in4: in STD_LOGIC_VECTOR(31 downto 0);
      in5: in STD_LOGIC_VECTOR(31 downto 0);
      in6: in STD_LOGIC_VECTOR(31 downto 0);
      in7: in STD_LOGIC_VECTOR(31 downto 0);
      control: in STD_LOGIC_VECTOR(2 downto 0);
      out1: out STD_LOGIC_VECTOR(31 downto 0)
    );
  end component;

  component adder
    port(
      a, b: in  STD_LOGIC_VECTOR(31 downto 0);
      y:    out STD_LOGIC_VECTOR(31 downto 0)
    );
  end component;

  component multiplier
    port (
      multiplier, multiplicand: in STD_LOGIC_VECTOR(31 downto 0);
      result: out STD_LOGIC_VECTOR(31 downto 0)
    );
  end component;

  component subtractor
    port(
      a, b: in  STD_LOGIC_VECTOR(31 downto 0);
      y:    out STD_LOGIC_VECTOR(31 downto 0)
    );
  end component;

  component divisor
    port (
      numerator, denominator: in STD_LOGIC_VECTOR(31 downto 0);
      result: out STD_LOGIC_VECTOR(31 downto 0)
    );
  end component;
  
  signal sAdderOutput: STD_LOGIC_VECTOR(31 downto 0);
  signal sMultiplierOutput: STD_LOGIC_VECTOR(31 downto 0);
  signal sSubtractorOutput: STD_LOGIC_VECTOR(31 downto 0);
  signal sDivisorOutput: STD_LOGIC_VECTOR(31 downto 0);

  signal sBus1Out: STD_LOGIC_VECTOR(31 downto 0);
  signal sBus2Out: STD_LOGIC_VECTOR(31 downto 0);
  signal sBus3Out: STD_LOGIC_VECTOR(31 downto 0);
  signal sBus4Out: STD_LOGIC_VECTOR(31 downto 0);
  signal sBus5Out: STD_LOGIC_VECTOR(31 downto 0);
  signal sBus6Out: STD_LOGIC_VECTOR(31 downto 0);
  signal sBus7Out: STD_LOGIC_VECTOR(31 downto 0);
  signal sBus8Out: STD_LOGIC_VECTOR(31 downto 0);
  signal sBus9Out: STD_LOGIC_VECTOR(31 downto 0);
  signal sBus10Out: STD_LOGIC_VECTOR(31 downto 0);

  signal sRegisterOut1: STD_LOGIC_VECTOR(31 downto 0);
  signal sRegisterOut2: STD_LOGIC_VECTOR(31 downto 0);
  signal sRegisterOut3: STD_LOGIC_VECTOR(31 downto 0);
  signal sRegisterOut4: STD_LOGIC_VECTOR(31 downto 0);
  signal sRegisterOut5: STD_LOGIC_VECTOR(31 downto 0);

begin

  bus7: bus7in port map(
    sSubtractorOutput,
    "00000000001011010000000000000000",
    "0000000000000000" & x,
    sAdderOutput,
    sMultiplierOutput,
    "00000000000001111000000000000000",
    "00000000000000011000000000000000",
    b7,
    sBus7Out
  );

  bus8: bus4in port map(
    sDivisorOutput,
    sSubtractorOutput,
    sMultiplierOutput,
    "00000000000000000010000000000000",
    b8,
    sBus8Out
  );

  bus9: bus2in port map(
    sDivisorOutput,
    sMultiplierOutput,
    b9,
    sBus9Out
  );

  bus10: bus4in port map(
    sMultiplierOutput,
    "00000000000000001010000000000000",
    "00000000000000000001000000000000",
    "00000001001110110000000000000000",
    b10,
    sBus10Out
  );

  register1: regs port map(
    clock, enableR1, reset,
    sBus7Out, sRegisterOut1
  );

  register2: regs port map(
    clock, enableR2, reset,
    sBus8Out, sRegisterOut2
  );

  register3: regs port map(
    clock, enableR3, reset,
    sBus9Out, sRegisterOut3
  );

  register4: regs port map(
    clock, enableR4, reset,
    sBus10Out, sRegisterOut4
  );

  register5: regs port map(
    clock, enableR5, reset,
    sBus7Out, sRegisterOut5
  );

  bus1: bus3in port map(
    sRegisterOut1,
    sRegisterOut2,
    sRegisterOut3,
    b1,
    sBus1Out
  );

  bus2: bus4in port map(
    sRegisterOut1,
    sRegisterOut2,
    sRegisterOut3,
    sRegisterOut4,
    b2,
    sBus2Out
  );

  bus3: bus3in port map(
    sRegisterOut1,
    sRegisterOut3,
    sRegisterOut4,
    b3,
    sBus3Out
  );

  bus4: bus4in port map(
    sRegisterOut1,
    sRegisterOut2,
    sRegisterOut4,
    sRegisterOut5,
    b4,
    sBus4Out
  );

  bus5: bus2in port map(
    sRegisterOut1,
    sRegisterOut4,
    b5,
    sBus5Out
  );

  bus6: bus2in port map(
    sRegisterOut2,
    sRegisterOut3,
    b6,
    sBus6Out
  );

  multiplier1: multiplier port map(
    sBus1Out, sBus2Out,
    sMultiplierOutput
  );

  adder1: adder port map(
    sBus1Out, sBus2Out,
    sAdderOutput
  );

  subtractor1: subtractor port map(
    sBus5Out, sBus6Out,
    sSubtractorOutput
  );

  divisor1: divisor port map(
    sBus3Out, sBus4Out,
    sDivisorOutput
  );

  r <= sBus3Out(15 downto 0);
end;
