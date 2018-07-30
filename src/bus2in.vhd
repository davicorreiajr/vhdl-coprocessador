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
    end case;
  end process;
end;