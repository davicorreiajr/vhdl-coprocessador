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
  eprom: eprom port map(
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

  process (start, sc)
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