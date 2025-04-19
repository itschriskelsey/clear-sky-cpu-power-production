-- Clear Sky Power Draw Software Functionality Testbench of "power_draw_simple.vhdl"
-- Created on April 18, 2025
-- By Chris Kelsey of Blue Vision Studios


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity power_draw_simple_tb is
end entity power_draw_simple_tb;

architecture sim of power_draw_simple_tb is

  -- Define signals for testing the power_draw_simple design
  signal a, b        : std_logic := '0';
  signal switch_v    : std_logic := '0';
  signal out_val     : std_logic;
  signal wattage     : integer := 0;

  -- Component declaration for the unit under test (UUT)
  component power_draw_simple is
    port (
      a        : in std_logic;
      b        : in std_logic;
      switch_v : in std_logic;
      out_val  : out std_logic;
      wattage  : out integer
    );
  end component;

begin

  -- Instantiate the UUT (Unit Under Test)
  uut: power_draw_simple
    port map (
      a => a,
      b => b,
      switch_v => switch_v,
      out_val => out_val,
      wattage => wattage
    );

  -- Process for testing functionality
  process
  begin
    -- Test: SWITCH(1, 1)
    a <= '0'; b <= '1'; switch_v <= '1'; wait for 10 ns;
    report "SWITCH(1, 1) = " & std_logic'image(out_val) & " Wattage = " & integer'image(wattage);

    -- Additional tests
    a <= '1'; b <= '0'; switch_v <= '0'; wait for 10 ns;
    report "SWITCH(0, 0) = " & std_logic'image(out_val) & " Wattage = " & integer'image(wattage);

    wait;
  end process;

end architecture sim;
