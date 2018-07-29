library IEEE; 
use IEEE.STD_LOGIC_1164.all;

entity bus2 is
  port (
    in1: in STD_LOGIC_VECTOR(31 downto 0);
    in2: in STD_LOGIC_VECTOR(31 downto 0);
    control: out STD_LOGIC;
    output: out STD_LOGIC_VECTOR(31 downto 0)
  );
end bus2;

architecture bus2 of bus2 is
  process(all)
  begin
    case control is
      when '0' => output <= in1;
      when '1' => output <= in2;
    end case;
  end process;
end;