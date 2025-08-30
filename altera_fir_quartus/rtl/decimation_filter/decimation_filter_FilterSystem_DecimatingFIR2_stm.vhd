-- ------------------------------------------------------------------------- 
-- High Level Design Compiler for Intel(R) FPGAs Version 18.1 (Release Build #625)
-- Quartus Prime development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2018 Intel Corporation.  All rights reserved.
-- Your use of  Intel Corporation's design tools,  logic functions and other
-- software and  tools, and its AMPP partner logic functions, and any output
-- files any  of the foregoing (including  device programming  or simulation
-- files), and  any associated  documentation  or information  are expressly
-- subject  to the terms and  conditions of the  Intel FPGA Software License
-- Agreement, Intel MegaCore Function License Agreement, or other applicable
-- license agreement,  including,  without limitation,  that your use is for
-- the  sole  purpose of  programming  logic devices  manufactured by  Intel
-- and  sold by Intel  or its authorized  distributors. Please refer  to the
-- applicable agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from decimation_filter_FilterSystem_DecimatingFIR2
-- VHDL created on Sun Feb 23 15:26:36 2025


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use std.TextIO.all;

entity decimation_filter_FilterSystem_DecimatingFIR2_stm is
    port (
        xIn_v_stm : out std_logic_vector(0 downto 0);
        xIn_c_stm : out std_logic_vector(7 downto 0);
        xIn_0_stm : out std_logic_vector(16 downto 0);
        busIn_writedata_stm : out std_logic_vector(15 downto 0);
        busIn_address_stm : out std_logic_vector(10 downto 0);
        busIn_write_stm : out std_logic_vector(0 downto 0);
        busIn_read_stm : out std_logic_vector(0 downto 0);
        busOut_readdatavalid_stm : out std_logic_vector(0 downto 0);
        busOut_readdata_stm : out std_logic_vector(15 downto 0);
        xOut_v_stm : out std_logic_vector(0 downto 0);
        xOut_c_stm : out std_logic_vector(7 downto 0);
        xOut_0_stm : out std_logic_vector(37 downto 0);
        clk : out std_logic;
        areset : out std_logic;
        h_areset : out std_logic
    );
end decimation_filter_FilterSystem_DecimatingFIR2_stm;

architecture normal of decimation_filter_FilterSystem_DecimatingFIR2_stm is

    signal clk_stm_sig : std_logic := '0';
    signal clk_stm_sig_stop : std_logic := '0';
    signal areset_stm_sig : std_logic := '1';
    signal h_areset_stm_sig : std_logic := '1';
    signal clk_xIn_stm_sig_stop : std_logic := '0';
    signal clk_busIn_stm_sig_stop : std_logic := '0';
    signal clk_busOut_stm_sig_stop : std_logic := '0';
    signal clk_xOut_stm_sig_stop : std_logic := '0';

    function str_to_stdvec(inp: string) return std_logic_vector is
        variable temp: std_logic_vector(inp'range) := (others => 'X');
    begin
        for i in inp'range loop
            IF ((inp(i) = '1')) THEN
                temp(i) := '1';
            elsif (inp(i) = '0') then
                temp(i) := '0';
            END IF;
            end loop;
            return temp;
        end function str_to_stdvec;
        

    begin

    clk <= clk_stm_sig;
    clk_process: process 
    begin
        wait for 200 ps;
        clk_stm_sig <= not clk_stm_sig;
        wait for 31249800 ps;
        if (clk_stm_sig_stop = '1') then
            assert (false)
            report "Arrived at end of stimulus data on clk clk" severity NOTE;
            wait;
        end if;
        wait for 200 ps;
        clk_stm_sig <= not clk_stm_sig;
        wait for 31249800 ps;
        if (clk_stm_sig_stop = '1') then
            assert (false)
            report "Arrived at end of stimulus data on clk clk" severity NOTE;
            wait;
        end if;
    end process;

    areset <= areset_stm_sig;
    areset_process: process begin
        areset_stm_sig <= '1';
        wait for 46875000 ps;
        areset_stm_sig <= '0';
        wait;
    end process;

    h_areset <= h_areset_stm_sig;
    h_areset_process: process begin
        h_areset_stm_sig <= '1';
        wait for 46875000 ps;
        h_areset_stm_sig <= '0';
        wait;
    end process;

        -- Generating stimulus for xIn
        xIn_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_xIn : text open read_mode is "decimation_filter/decimation_filter_FilterSystem_DecimatingFIR2_xIn.stm";
            variable xIn_v_int_0 : Integer;
            variable xIn_v_temp : std_logic_vector(0 downto 0);
            variable xIn_c_int_0 : Integer;
            variable xIn_c_temp : std_logic_vector(7 downto 0);
            variable xIn_0_int_0 : Integer;
            variable xIn_0_temp : std_logic_vector(16 downto 0);

        begin
            -- initialize all outputs to 0
            xIn_v_stm <= (others => '0');
            xIn_c_stm <= (others => '0');
            xIn_0_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            while true loop
            
                IF (endfile(data_file_xIn)) THEN
                    clk_xIn_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_xIn, L);
                    
                    read(L, xIn_v_int_0);
                    xIn_v_temp(0 downto 0) := std_logic_vector(to_unsigned(xIn_v_int_0, 1));
                    xIn_v_stm <= xIn_v_temp;
                    read(L, xIn_c_int_0);
                    xIn_c_temp(7 downto 0) := std_logic_vector(to_unsigned(xIn_c_int_0, 8));
                    xIn_c_stm <= xIn_c_temp;
                    read(L, xIn_0_int_0);
                    xIn_0_temp(16 downto 0) := std_logic_vector(to_unsigned(xIn_0_int_0, 17));
                    xIn_0_stm <= xIn_0_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;
        -- Generating stimulus for busIn
        busIn_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_busIn : text open read_mode is "decimation_filter/decimation_filter_FilterSystem_DecimatingFIR2_busIn.stm";
            variable busIn_writedata_int_0 : Integer;
            variable busIn_writedata_temp : std_logic_vector(15 downto 0);
            variable busIn_address_int_0 : Integer;
            variable busIn_address_temp : std_logic_vector(10 downto 0);
            variable busIn_write_int_0 : Integer;
            variable busIn_write_temp : std_logic_vector(0 downto 0);
            variable busIn_read_int_0 : Integer;
            variable busIn_read_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            busIn_writedata_stm <= (others => '0');
            busIn_address_stm <= (others => '0');
            busIn_write_stm <= (others => '0');
            busIn_read_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            while true loop
            
                IF (endfile(data_file_busIn)) THEN
                    clk_busIn_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_busIn, L);
                    
                    read(L, busIn_writedata_int_0);
                    busIn_writedata_temp(15 downto 0) := std_logic_vector(to_unsigned(busIn_writedata_int_0, 16));
                    busIn_writedata_stm <= busIn_writedata_temp;
                    read(L, busIn_address_int_0);
                    busIn_address_temp(10 downto 0) := std_logic_vector(to_unsigned(busIn_address_int_0, 11));
                    busIn_address_stm <= busIn_address_temp;
                    read(L, busIn_write_int_0);
                    busIn_write_temp(0 downto 0) := std_logic_vector(to_unsigned(busIn_write_int_0, 1));
                    busIn_write_stm <= busIn_write_temp;
                    read(L, busIn_read_int_0);
                    busIn_read_temp(0 downto 0) := std_logic_vector(to_unsigned(busIn_read_int_0, 1));
                    busIn_read_stm <= busIn_read_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;
        -- Generating stimulus for xOut
        xOut_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_xOut : text open read_mode is "decimation_filter/decimation_filter_FilterSystem_DecimatingFIR2_xOut.stm";
            variable xOut_v_int_0 : Integer;
            variable xOut_v_temp : std_logic_vector(0 downto 0);
            variable xOut_c_int_0 : Integer;
            variable xOut_c_temp : std_logic_vector(7 downto 0);
            variable xOut_0_int_0 : Integer;
            variable xOut_0_int_1 : Integer;
            variable xOut_0_temp : std_logic_vector(37 downto 0);

        begin
            -- initialize all outputs to 0
            xOut_v_stm <= (others => '0');
            xOut_c_stm <= (others => '0');
            xOut_0_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            while true loop
            
                IF (endfile(data_file_xOut)) THEN
                    clk_xOut_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_xOut, L);
                    
                    read(L, xOut_v_int_0);
                    xOut_v_temp(0 downto 0) := std_logic_vector(to_unsigned(xOut_v_int_0, 1));
                    xOut_v_stm <= xOut_v_temp;
                    read(L, xOut_c_int_0);
                    xOut_c_temp(7 downto 0) := std_logic_vector(to_unsigned(xOut_c_int_0, 8));
                    xOut_c_stm <= xOut_c_temp;
                    read(L, xOut_0_int_0);
                    xOut_0_temp(31 downto 0) := std_logic_vector(to_signed(xOut_0_int_0, 32));
                    read(L, xOut_0_int_1);
                    xOut_0_temp(37 downto 32) := std_logic_vector(to_unsigned(xOut_0_int_1, 6));
                    xOut_0_stm <= xOut_0_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

    clk_stm_sig_stop <= clk_xIn_stm_sig_stop OR clk_xOut_stm_sig_stop OR '0';


    END normal;
