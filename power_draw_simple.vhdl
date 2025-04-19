library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity power_draw_simple is
    port (
        a        : in std_logic;
        b        : in std_logic;
        switch_v : in std_logic;
        out_val  : out std_logic;
        wattage  : out integer
    );
end entity power_draw_simple;

architecture behavioral of power_draw_simple is
    -- Internal signals to track transitions
    signal last_a, last_b, last_switch_v : std_logic := '0';  -- Store previous states
    signal transitions : integer := 0;  -- Counter for transitions

    -- Define constant values for simplicity
    constant CAPACITANCE : real := 1.0;  -- Example value (you can refine based on the circuit)
    constant VOLTAGE : real := 1.2;  -- Example voltage (1.2V typical for logic circuits)
    constant FREQUENCY : real := 1.0e9;  -- Assume a frequency of 1 GHz for simplicity

begin
    -- Output wattage calculation based on transitions
    process(a, b, switch_v)
    begin
        -- Count transitions for each signal
        if (a /= last_a) then
            transitions <= transitions + 1;
            last_a <= a;
        end if;
        
        if (b /= last_b) then
            transitions <= transitions + 1;
            last_b <= b;
        end if;
        
        if (switch_v /= last_switch_v) then
            transitions <= transitions + 1;
            last_switch_v <= switch_v;
        end if;

        -- Estimate power based on transitions
        -- Cast transitions to real before multiplying
        wattage <= integer(real(transitions) * CAPACITANCE * (VOLTAGE ** 2) * FREQUENCY);
    end process;

    -- Boolean NOT logic-based output
    -- Here, we use NOT gates on the input signals as per your request.
    out_val <= not a and not b and not switch_v;  -- Applying NOT gate on each signal and ANDing the results
end architecture behavioral;
