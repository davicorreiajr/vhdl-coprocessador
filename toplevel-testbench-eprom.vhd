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
  signal clk: STD_LOGIC;
begin

  eprom1: eprom port map(
    "1010", '1', '1',
    sB1, sB2, sB3, sB4, sB5, sB6, sB7, sB8, sB9, sB10,
    sEnableR1, sEnableR2, sEnableR3, sEnableR4, sEnableR5,
    sEnableR, sDone
  );

  -- Generate clock with 10 ns period
  process begin
    clk <= '1';
    wait for 5 ns; 
    clk <= '0';
    wait for 5 ns;
  end process;

  process(clk) begin
    if(rising_edge(clk))
    then
      if(
        sB1 = "00" and
        sB2 = "10" and
        sB3 = "01" and
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
    end if;
  end process;
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
        done <= '0';

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