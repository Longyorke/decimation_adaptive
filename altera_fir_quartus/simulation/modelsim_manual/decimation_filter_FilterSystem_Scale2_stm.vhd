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

-- VHDL created from decimation_filter_FilterSystem_Scale2
-- VHDL created on Thu Jan 23 17:48:43 2025


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use std.TextIO.all;

entity decimation_filter_FilterSystem_Scale2_stm is
    port (
        xIn_v_stm : out std_logic_vector(0 downto 0);
        xIn_c_stm : out std_logic_vector(7 downto 0);
        xIn_0_stm : out std_logic_vector(36 downto 0);
        gain_i_stm : out std_logic_vector(0 downto 0);
        qOut_v_stm : out std_logic_vector(0 downto 0);
        qOut_c_stm : out std_logic_vector(7 downto 0);
        qOut_0_stm : out std_logic_vector(16 downto 0);
        eOut_0_stm : out std_logic_vector(0 downto 0);
        clk : out std_logic;
        areset : out std_logic
    );
end decimation_filter_FilterSystem_Scale2_stm;

architecture normal of decimation_filter_FilterSystem_Scale2_stm is

    signal clk_stm_sig : std_logic := '0';
    signal clk_stm_sig_stop : std_logic := '0';
    signal areset_stm_sig : std_logic := '1';
    signal clk_xIn_stm_sig_stop : std_logic := '0';
    signal clk_qOut_stm_sig_stop : std_logic := '0';

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

        -- Generating stimulus for xIn
        xIn_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_xIn : text open read_mode is "decimation_filter/decimation_filter_FilterSystem_Scale2_xIn.stm";
            variable xIn_v_int_0 : Integer;
            variable xIn_v_temp : std_logic_vector(0 downto 0);
            variable xIn_c_int_0 : Integer;
            variable xIn_c_temp : std_logic_vector(7 downto 0);
            variable xIn_0_int_0 : Integer;
            variable xIn_0_int_1 : Integer;
            variable xIn_0_temp : std_logic_vector(36 downto 0);
            variable gain_i_int_0 : Integer;
            variable gain_i_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            xIn_v_stm <= (others => '0');
            xIn_c_stm <= (others => '0');
            xIn_0_stm <= (others => '0');
            gain_i_stm <= (others => '0');

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
                    xIn_0_temp(31 downto 0) := std_logic_vector(to_signed(xIn_0_int_0, 32));
                    read(L, xIn_0_int_1);
                    xIn_0_temp(36 downto 32) := std_logic_vector(to_unsigned(xIn_0_int_1, 5));
                    xIn_0_stm <= xIn_0_temp;
                    read(L, gain_i_int_0);
                    gain_i_temp(0 downto 0) := std_logic_vector(to_unsigned(gain_i_int_0, 1));
                    gain_i_stm <= gain_i_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;
        -- Generating stimulus for qOut
        qOut_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_qOut : text open read_mode is "decimation_filter/decimation_filter_FilterSystem_Scale2_qOut.stm";
            variable qOut_v_int_0 : Integer;
            variable qOut_v_temp : std_logic_vector(0 downto 0);
            variable qOut_c_int_0 : Integer;
            variable qOut_c_temp : std_logic_vector(7 downto 0);
            variable qOut_0_int_0 : Integer;
            variable qOut_0_temp : std_logic_vector(16 downto 0);
            variable eOut_0_int_0 : Integer;
            variable eOut_0_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            qOut_v_stm <= (others => '0');
            qOut_c_stm <= (others => '0');
            qOut_0_stm <= (others => '0');
            eOut_0_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            while true loop
            
                IF (endfile(data_file_qOut)) THEN
                    clk_qOut_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_qOut, L);
                    
                    read(L, qOut_v_int_0);
                    qOut_v_temp(0 downto 0) := std_logic_vector(to_unsigned(qOut_v_int_0, 1));
                    qOut_v_stm <= qOut_v_temp;
                    read(L, qOut_c_int_0);
                    qOut_c_temp(7 downto 0) := std_logic_vector(to_unsigned(qOut_c_int_0, 8));
                    qOut_c_stm <= qOut_c_temp;
                    read(L, qOut_0_int_0);
                    qOut_0_temp(16 downto 0) := std_logic_vector(to_unsigned(qOut_0_int_0, 17));
                    qOut_0_stm <= qOut_0_temp;
                    read(L, eOut_0_int_0);
                    eOut_0_temp(0 downto 0) := std_logic_vector(to_unsigned(eOut_0_int_0, 1));
                    eOut_0_stm <= eOut_0_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

    clk_stm_sig_stop <= clk_xIn_stm_sig_stop OR clk_qOut_stm_sig_stop OR '0';


    END normal;
