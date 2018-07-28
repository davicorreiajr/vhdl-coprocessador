library IEEE; 
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD_UNSIGNED.all;

entity eprom is
  port(
    address: in STD_LOGIC_VECTOR(5 downto 0);
    value: out STD_LOGIC_VECTOR(24 downto 0)
  );
end;

architecture arch of divisor is
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
  signal done: STD_LOGIC;
begin
  process(all) begin
    case address is
      when "000000" =>
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

    value <= b1 & b2 & b3 & b4 & b5 & b6 & b7 & b8 & b9 & b10 & enableR1 & enableR2 & enableR3 & enableR4 & enableR5 & enableR & done;
  end process;
end;