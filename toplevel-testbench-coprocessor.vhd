library IEEE; 
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD_UNSIGNED.all;

entity testbenchCoprocessor is
end;

architecture testbenchCoprocessor of testbenchCoprocessor is

  component coprocessor
    port (
      x: in STD_LOGIC_VECTOR(15 downto 0);
      sc: in STD_LOGIC;
      start: in STD_LOGIC;
      reset: in STD_LOGIC;
      clock: in STD_LOGIC;
      r: out STD_LOGIC_VECTOR(15 downto 0);
      done: out STD_LOGIC;
      debugBus1: out STD_LOGIC_VECTOR(31 downto 0);
      debugBus2: out STD_LOGIC_VECTOR(31 downto 0);
      debugBus3: out STD_LOGIC_VECTOR(31 downto 0);
      debugBus4: out STD_LOGIC_VECTOR(31 downto 0);
      debugBus5: out STD_LOGIC_VECTOR(31 downto 0);
      debugBus6: out STD_LOGIC_VECTOR(31 downto 0);
      debugBus7: out STD_LOGIC_VECTOR(31 downto 0);
      debugBus8: out STD_LOGIC_VECTOR(31 downto 0);
      debugBus9: out STD_LOGIC_VECTOR(31 downto 0);
      debugBus10: out STD_LOGIC_VECTOR(31 downto 0)
    );
  end component;

  signal sResult: STD_LOGIC_VECTOR(15 downto 0);
  signal sClock: STD_LOGIC;
  signal sStart: STD_LOGIC;
  signal sReset: STD_LOGIC;
  signal sDone: STD_LOGIC;

  signal sDebugBus1: STD_LOGIC_VECTOR(31 downto 0);
  signal sDebugBus2: STD_LOGIC_VECTOR(31 downto 0);
  signal sDebugBus3: STD_LOGIC_VECTOR(31 downto 0);
  signal sDebugBus4: STD_LOGIC_VECTOR(31 downto 0);
  signal sDebugBus5: STD_LOGIC_VECTOR(31 downto 0);
  signal sDebugBus6: STD_LOGIC_VECTOR(31 downto 0);
  signal sDebugBus7: STD_LOGIC_VECTOR(31 downto 0);
  signal sDebugBus8: STD_LOGIC_VECTOR(31 downto 0);
  signal sDebugBus9: STD_LOGIC_VECTOR(31 downto 0);
  signal sDebugBus10: STD_LOGIC_VECTOR(31 downto 0);
begin

  coprocessor1: coprocessor port map(
    "0000000000000000",
    '0',
    sStart, sReset, sClock,
    sResult, sDone,
    sDebugBus1,
    sDebugBus2,
    sDebugBus3,
    sDebugBus4,
    sDebugBus5,
    sDebugBus6,
    sDebugBus7,
    sDebugBus8,
    sDebugBus9,
    sDebugBus10
  );

  process begin
    sClock <= '0';
    wait for 5 ns; 
    sClock <= '1';
    wait for 5 ns;
  end process;

  process begin
    sReset <= '1';
    wait for 10 ns;
    sReset <= '0';
    wait;
  end process;

  process begin
    sStart <= '0';
    wait for 10 ns;
    sStart <= '1';
    wait for 10 ns;
    sStart <= '0';
    wait;
  end process;

  process (sClock) begin
    if(rising_edge(sClock) and sDone = '1') then
      if (
        sResult = "0000000000000000" and
        sDebugBus1 = "0000000000000000" and
        sDebugBus2 = "0000000000000000" and
        sDebugBus3 = "0000000000000000" and
        sDebugBus4 = "0000000000000000" and
        sDebugBus5 = "0000000000000000" and
        sDebugBus6 = "0000000000000000" and
        sDebugBus7 = "0000000000000000" and
        sDebugBus8 = "0000000000000000" and
        sDebugBus9 = "0000000000000000" and
        sDebugBus10 = "0000000000000000"
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

entity coprocessor is
  port (
    x: in STD_LOGIC_VECTOR(15 downto 0);
    sc: in STD_LOGIC;
    start: in STD_LOGIC;
    reset: in STD_LOGIC;
    clock: in STD_LOGIC;
    r: out STD_LOGIC_VECTOR(15 downto 0);
    done: out STD_LOGIC;
    debugBus1: out STD_LOGIC_VECTOR(31 downto 0);
    debugBus2: out STD_LOGIC_VECTOR(31 downto 0);
    debugBus3: out STD_LOGIC_VECTOR(31 downto 0);
    debugBus4: out STD_LOGIC_VECTOR(31 downto 0);
    debugBus5: out STD_LOGIC_VECTOR(31 downto 0);
    debugBus6: out STD_LOGIC_VECTOR(31 downto 0);
    debugBus7: out STD_LOGIC_VECTOR(31 downto 0);
    debugBus8: out STD_LOGIC_VECTOR(31 downto 0);
    debugBus9: out STD_LOGIC_VECTOR(31 downto 0);
    debugBus10: out STD_LOGIC_VECTOR(31 downto 0)
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
      r: out STD_LOGIC_VECTOR(15 downto 0);
      debugBus1: out STD_LOGIC_VECTOR(31 downto 0);
      debugBus2: out STD_LOGIC_VECTOR(31 downto 0);
      debugBus3: out STD_LOGIC_VECTOR(31 downto 0);
      debugBus4: out STD_LOGIC_VECTOR(31 downto 0);
      debugBus5: out STD_LOGIC_VECTOR(31 downto 0);
      debugBus6: out STD_LOGIC_VECTOR(31 downto 0);
      debugBus7: out STD_LOGIC_VECTOR(31 downto 0);
      debugBus8: out STD_LOGIC_VECTOR(31 downto 0);
      debugBus9: out STD_LOGIC_VECTOR(31 downto 0);
      debugBus10: out STD_LOGIC_VECTOR(31 downto 0)
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
  signal sR: STD_LOGIC_VECTOR(15 downto 0);

  signal sDebugBus1: STD_LOGIC_VECTOR(31 downto 0);
  signal sDebugBus2: STD_LOGIC_VECTOR(31 downto 0);
  signal sDebugBus3: STD_LOGIC_VECTOR(31 downto 0);
  signal sDebugBus4: STD_LOGIC_VECTOR(31 downto 0);
  signal sDebugBus5: STD_LOGIC_VECTOR(31 downto 0);
  signal sDebugBus6: STD_LOGIC_VECTOR(31 downto 0);
  signal sDebugBus7: STD_LOGIC_VECTOR(31 downto 0);
  signal sDebugBus8: STD_LOGIC_VECTOR(31 downto 0);
  signal sDebugBus9: STD_LOGIC_VECTOR(31 downto 0);
  signal sDebugBus10: STD_LOGIC_VECTOR(31 downto 0);
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
    sR,
    sDebugBus1,
    sDebugBus2,
    sDebugBus3,
    sDebugBus4,
    sDebugBus5,
    sDebugBus6,
    sDebugBus7,
    sDebugBus8,
    sDebugBus9,
    sDebugBus10
  );

  done <= sDone;
  r <= sR;

  debugBus1 <= sDebugBus1;
  debugBus2 <= sDebugBus2;
  debugBus3 <= sDebugBus3;
  debugBus4 <= sDebugBus4;
  debugBus5 <= sDebugBus5;
  debugBus6 <= sDebugBus6;
  debugBus7 <= sDebugBus7;
  debugBus8 <= sDebugBus8;
  debugBus9 <= sDebugBus9;
  debugBus10 <= sDebugBus10;
end;

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity unitControl is
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
end unitControl;

architecture unitControl of unitControl is

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

  type state is (S0, S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, S12, S13);
  signal sCurrentState, sNextState: state;
  signal sCurrentStateEprom: STD_LOGIC_VECTOR(3 downto 0);

begin
  eprom1: eprom port map(
    sCurrentStateEprom,
    start, sc,
    b1, b2, b3, b4, b5, b6, b7, b8, b9, b10,
    enableR1, enableR2, enableR3, enableR4, enableR5,
    enableR, done
  );

  process(clock, reset)
  begin
    
    if reset = '1' then
      sCurrentState <= S0;
    elsif rising_edge(clock) then
      sCurrentState <= sNextState;
    end if;

  end process;

  process (start, sc, sCurrentState)
  begin

    case sCurrentState is
      
      when S0 =>
        if start = '1' then
          
          if sc = '1' then
            sNextState <= S1;
          else
            sNextState <= S8;
          end if ;
        
        else
          sNextState <= S0;
        end if;
      
      when S1 => sNextState <= S2;
      when S2 => sNextState <= S3;
      when S3 => sNextState <= S4;
      when S4 => sNextState <= S5;
      when S5 => sNextState <= S6;
      when S6 => sNextState <= S7;
      when S7 => sNextState <= S0;

      when S8 => sNextState <= S9;
      when S9 => sNextState <= S10;
      when S10 => sNextState <= S11;
      when S11 => sNextState <= S12;
      when S12 => sNextState <= S13;
      when S13 => sNextState <= S0;

      when others => sNextState <= S0;
    end case;
  end process;

  with sCurrentState select
    sCurrentStateEprom <=
    "0000" when S0,
    "0001" when S1,
    "0010" when S2,
    "0011" when S3,
    "0100" when S4,
    "0101" when S5,
    "0110" when S6,
    "0111" when S7,
    "1000" when S8,
    "1001" when S9,
    "1010" when S10,
    "1011" when S11,
    "1100" when S12,
    "1101" when S13;

end;

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
    r: out STD_LOGIC_VECTOR(15 downto 0);
    debugBus1: out STD_LOGIC_VECTOR(31 downto 0);
    debugBus2: out STD_LOGIC_VECTOR(31 downto 0);
    debugBus3: out STD_LOGIC_VECTOR(31 downto 0);
    debugBus4: out STD_LOGIC_VECTOR(31 downto 0);
    debugBus5: out STD_LOGIC_VECTOR(31 downto 0);
    debugBus6: out STD_LOGIC_VECTOR(31 downto 0);
    debugBus7: out STD_LOGIC_VECTOR(31 downto 0);
    debugBus8: out STD_LOGIC_VECTOR(31 downto 0);
    debugBus9: out STD_LOGIC_VECTOR(31 downto 0);
    debugBus10: out STD_LOGIC_VECTOR(31 downto 0)
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
    clock, enableR1, reset,
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
  debugBus1 <= sBus1Out;
  debugBus2 <= sBus2Out;
  debugBus3 <= sBus3Out;
  debugBus4 <= sBus4Out;
  debugBus5 <= sBus5Out;
  debugBus6 <= sBus6Out;
  debugBus7 <= sBus7Out;
  debugBus8 <= sBus8Out;
  debugBus9 <= sBus9Out;
  debugBus10 <= sBus10Out;
end;

library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use IEEE.NUMERIC_STD_UNSIGNED.all;

entity adder is
  port(
    a, b: in  STD_LOGIC_VECTOR(31 downto 0);
    y:    out STD_LOGIC_VECTOR(31 downto 0)
  );
end;

architecture adder of adder is
begin
  y <= a + b;
end;

library IEEE; 
use IEEE.STD_LOGIC_1164.all;

entity bus2in is
  port (
    in1: in STD_LOGIC_VECTOR(31 downto 0);
    in2: in STD_LOGIC_VECTOR(31 downto 0);
    control: in STD_LOGIC;
    out1: out STD_LOGIC_VECTOR(31 downto 0)
  );
end bus2in;

architecture bus2in of bus2in is
begin
  process(all)
  begin
    case control is
      when '0' => out1 <= in1;
      when '1' => out1 <= in2;
      when others => out1 <= (others => '0');
    end case;
  end process;
end;

library IEEE; 
use IEEE.STD_LOGIC_1164.all;

entity bus3in is
  port (
    in1: in STD_LOGIC_VECTOR(31 downto 0);
    in2: in STD_LOGIC_VECTOR(31 downto 0);
    in3: in STD_LOGIC_VECTOR(31 downto 0);
    control: in STD_LOGIC_VECTOR(1 downto 0);
    out1: out STD_LOGIC_VECTOR(31 downto 0)
  );
end bus3in;

architecture bus3in of bus3in is
begin
  process(all)
  begin
    case control is
      when "00" => out1 <= in1;
      when "01" => out1 <= in2;
      when "10" => out1 <= in3;
      when "11" => out1 <= (others => '0');
      when others => out1 <= (others => '0');
    end case;
  end process;
end;

library IEEE; 
use IEEE.STD_LOGIC_1164.all;

entity bus4in is
  port (
    in1: in STD_LOGIC_VECTOR(31 downto 0);
    in2: in STD_LOGIC_VECTOR(31 downto 0);
    in3: in STD_LOGIC_VECTOR(31 downto 0);
    in4: in STD_LOGIC_VECTOR(31 downto 0);
    control: in STD_LOGIC_VECTOR(1 downto 0);
    out1: out STD_LOGIC_VECTOR(31 downto 0)
  );
end bus4in;

architecture bus4in of bus4in is
begin
  process(all)
  begin
    case control is
      when "00" => out1 <= in1;
      when "01" => out1 <= in2;
      when "10" => out1 <= in3;
      when "11" => out1 <= in4;
      when others => out1 <= (others => '0');
    end case;
  end process;
end;

library IEEE; 
use IEEE.STD_LOGIC_1164.all;

entity bus7in is
  port (
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
end bus7in;

architecture bus7in of bus7in is
begin
  process(all)
  begin
    case control is
      when "000" => out1 <= in1;
      when "001" => out1 <= in2;
      when "010" => out1 <= in3;
      when "011" => out1 <= in4;
      when "100" => out1 <= in5;
      when "101" => out1 <= in6;
      when "110" => out1 <= in7;
      when "111" => out1 <= (others => '0');
      when others => out1 <= (others => '0');
    end case;
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
  signal sResult: sfixed(32 downto -31);
begin
  numerator_fixed <= to_sfixed(numerator, numerator_fixed);
  denominator_fixed <= to_sfixed(denominator, denominator_fixed);
  sResult <= numerator_fixed / denominator_fixed;
  result <= to_slv(sResult(19 downto -12));
end;

library IEEE; 
use IEEE.STD_LOGIC_1164.all;

entity eprom is
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
end;

architecture arch2 of eprom is
begin
  process(all) begin
    case currentState is
      when "0000" =>
        if start = '0' then
          b1 <= "00";
          b2 <= "00";
          b3 <= "00";
          b4 <= "00";
          b5 <= '0';
          b6 <= '0';
          b7 <= "000";
          b8 <= "00";
          b9 <= '0';
          b10 <= "00";
          enableR1 <= '0';
          enableR2 <= '0';
          enableR3 <= '0';
          enableR4 <= '0';
          enableR5 <= '0';
          enableR <= '0';
          done <= '0';
        else
          b1 <= "00";
          b2 <= "00";
          b3 <= "00";
          b4 <= "00";
          b5 <= '0';
          b6 <= '0';
          b7 <= "010";
          b8 <= "00";
          b9 <= '0';
          b10 <= "00";
          enableR1 <= '1';
          enableR2 <= '0';
          enableR3 <= '0';
          enableR4 <= '0';
          enableR5 <= '0';
          enableR <= '0';
          done <= '0';
        end if;

      when "0001" =>
        b1 <= "00";
        b2 <= "00";
        b3 <= "00";
        b4 <= "00";
        b5 <= '0';
        b6 <= '0';
        b7 <= "000";
        b8 <= "10";
        b9 <= '0';
        b10 <= "00";
        enableR1 <= '0';
        enableR2 <= '1';
        enableR3 <= '0';
        enableR4 <= '0';
        enableR5 <= '0';
        enableR <= '0';
        done <= '0';
      
      when "0010" =>
        b1 <= "01";
        b2 <= "00";
        b3 <= "00";
        b4 <= "00";
        b5 <= '0';
        b6 <= '0';
        b7 <= "000";
        b8 <= "00";
        b9 <= '1';
        b10 <= "01";
        enableR1 <= '0';
        enableR2 <= '0';
        enableR3 <= '1';
        enableR4 <= '1';
        enableR5 <= '0';
        enableR <= '0';
        done <= '0';
    
      when "0011" =>
        b1 <= "01";
        b2 <= "10";
        b3 <= "01";
        b4 <= "10";
        b5 <= '0';
        b6 <= '0';
        b7 <= "101";
        b8 <= "00";
        b9 <= '0';
        b10 <= "00";
        enableR1 <= '0';
        enableR2 <= '0';
        enableR3 <= '1';
        enableR4 <= '1';
        enableR5 <= '1';
        enableR <= '0';
        done <= '0';

      when "0100" =>
        b1 <= "01";
        b2 <= "11";
        b3 <= "10";
        b4 <= "11";
        b5 <= '0';
        b6 <= '1';
        b7 <= "000";
        b8 <= "00";
        b9 <= '1';
        b10 <= "11";
        enableR1 <= '1';
        enableR2 <= '1';
        enableR3 <= '1';
        enableR4 <= '1';
        enableR5 <= '0';
        enableR <= '0';
        done <= '0';
      
      when "0101" =>
        b1 <= "00";
        b2 <= "01";
        b3 <= "01";
        b4 <= "10";
        b5 <= '0';
        b6 <= '0';
        b7 <= "011";
        b8 <= "00";
        b9 <= '0';
        b10 <= "00";
        enableR1 <= '1';
        enableR2 <= '1';
        enableR3 <= '0';
        enableR4 <= '0';
        enableR5 <= '0';
        enableR <= '0';
        done <= '0';

      when "0110" =>
        b1 <= "00";
        b2 <= "00";
        b3 <= "00";
        b4 <= "00";
        b5 <= '0';
        b6 <= '0';
        b7 <= "000";
        b8 <= "00";
        b9 <= '0';
        b10 <= "00";
        enableR1 <= '1';
        enableR2 <= '0';
        enableR3 <= '0';
        enableR4 <= '0';
        enableR5 <= '0';
        enableR <= '0';
        done <= '0';

      when "0111" =>
        b1 <= "00";
        b2 <= "00";
        b3 <= "00";
        b4 <= "00";
        b5 <= '0';
        b6 <= '0';
        b7 <= "000";
        b8 <= "00";
        b9 <= '0';
        b10 <= "00";
        enableR1 <= '0';
        enableR2 <= '0';
        enableR3 <= '0';
        enableR4 <= '0';
        enableR5 <= '0';
        enableR <= '1';
        done <= '1';

      when "1000" =>
        b1 <= "00";
        b2 <= "00";
        b3 <= "00";
        b4 <= "00";
        b5 <= '0';
        b6 <= '0';
        b7 <= "100";
        b8 <= "11";
        b9 <= '0';
        b10 <= "00";
        enableR1 <= '1';
        enableR2 <= '1';
        enableR3 <= '0';
        enableR4 <= '0';
        enableR5 <= '0';
        enableR <= '0';
        done <= '0';

      when "1001" =>
        b1 <= "00";
        b2 <= "00";
        b3 <= "00";
        b4 <= "01";
        b5 <= '0';
        b6 <= '0';
        b7 <= "110";
        b8 <= "00";
        b9 <= '1';
        b10 <= "10";
        enableR1 <= '0';
        enableR2 <= '1';
        enableR3 <= '1';
        enableR4 <= '1';
        enableR5 <= '1';
        enableR <= '0';
        done <= '0';

      when "1010" =>
        b1 <= "00";
        b2 <= "10";
        b3 <= "01";
        b4 <= "11";
        b5 <= '1';
        b6 <= '0';
        b7 <= "001";
        b8 <= "01";
        b9 <= '0';
        b10 <= "00";
        enableR1 <= '1';
        enableR2 <= '1';
        enableR3 <= '1';
        enableR4 <= '1';
        enableR5 <= '0';
        enableR <= '0';
        done <= '0';
        
      when "1011" =>
        b1 <= "10";
        b2 <= "01";
        b3 <= "10";
        b4 <= "00";
        b5 <= '0';
        b6 <= '0';
        b7 <= "011";
        b8 <= "00";
        b9 <= '0';
        b10 <= "00";
        enableR1 <= '1';
        enableR2 <= '1';
        enableR3 <= '0';
        enableR4 <= '0';
        enableR5 <= '0';
        enableR <= '0';
        done <= '0';

      when "1100" =>
        b1 <= "00";
        b2 <= "00";
        b3 <= "00";
        b4 <= "00";
        b5 <= '0';
        b6 <= '0';
        b7 <= "000";
        b8 <= "00";
        b9 <= '0';
        b10 <= "00";
        enableR1 <= '1';
        enableR2 <= '0';
        enableR3 <= '0';
        enableR4 <= '0';
        enableR5 <= '0';
        enableR <= '0';
        done <= '0';

      when "1101" =>
        b1 <= "00";
        b2 <= "00";
        b3 <= "00";
        b4 <= "00";
        b5 <= '0';
        b6 <= '0';
        b7 <= "000";
        b8 <= "00";
        b9 <= '0';
        b10 <= "00";
        enableR1 <= '0';
        enableR2 <= '0';
        enableR3 <= '0';
        enableR4 <= '0';
        enableR5 <= '0';
        enableR <= '0';
        done <= '1';

      when others =>
        b1 <= "00";
        b2 <= "00";
        b3 <= "00";
        b4 <= "00";
        b5 <= '0';
        b6 <= '0';
        b7 <= "000";
        b8 <= "00";
        b9 <= '0';
        b10 <= "00";
        enableR1 <= '0';
        enableR2 <= '0';
        enableR3 <= '0';
        enableR4 <= '0';
        enableR5 <= '0';
        enableR <= '0';
        done <= '0';
    end case;
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

library IEEE;
use IEEE.std_logic_1164.all;

entity regs is
  port(
    clock, enable, clear: in STD_LOGIC;
    in1: in STD_LOGIC_VECTOR(31 downto 0);
    out1: out STD_LOGIC_VECTOR(31 downto 0)
  );
end regs;

architecture regs of regs is
begin
  process(clock, enable, clear)
  begin
    if rising_edge(clock) then
      if clear = '1' then
        out1 <= (others => '0');
      elsif enable = '1' then
        out1 <= in1;
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
