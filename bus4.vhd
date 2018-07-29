library IEEE; 
use IEEE.STD_LOGIC_1164.all;

entity bus4 is
  port (
    in1: in STD_LOGIC_VECTOR(31 downto 0);
    in2: in STD_LOGIC_VECTOR(31 downto 0);
    in3: in STD_LOGIC_VECTOR(31 downto 0);
    in4: in STD_LOGIC_VECTOR(31 downto 0);
    control: out STD_LOGIC_VECTOR(1 downto 0);
    out1: out STD_LOGIC_VECTOR(31 downto 0)
  );
end bus4;

architecture bus4 of bus4 is
  process(all)
  begin
    case control is
      when "00" => out1 <= in1;
      when "01" => out1 <= in2;
      when "10" => out1 <= in3;
      when "11" => out1 <= in4;
    end case;
  end process;
end;