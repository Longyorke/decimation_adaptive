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

-- VHDL created from decimation_filter_FilterSystem
-- VHDL created on Thu Jan 23 17:48:41 2025


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use std.TextIO.all;

entity decimation_filter_FilterSystem_stm is
    port (
        busIn_writedata_stm : out std_logic_vector(15 downto 0);
        busIn_address_stm : out std_logic_vector(10 downto 0);
        busIn_write_stm : out std_logic_vector(0 downto 0);
        busIn_read_stm : out std_logic_vector(0 downto 0);
        busOut_readdatavalid_stm : out std_logic_vector(0 downto 0);
        busOut_readdata_stm : out std_logic_vector(15 downto 0);
        busOut_waitrequest_stm : out std_logic_vector(0 downto 0);
        a_stm : out std_logic_vector(16 downto 0);
        av_stm : out std_logic_vector(0 downto 0);
        ac_stm : out std_logic_vector(7 downto 0);
        q_stm : out std_logic_vector(16 downto 0);
        qv_stm : out std_logic_vector(0 downto 0);
        qc_stm : out std_logic_vector(7 downto 0);
        clk : out std_logic;
        areset : out std_logic;
        h_areset : out std_logic
    );
end decimation_filter_FilterSystem_stm;

architecture normal of decimation_filter_FilterSystem_stm is

    signal clk_stm_sig : std_logic := '0';
    signal clk_stm_sig_stop : std_logic := '0';
    signal areset_stm_sig : std_logic := '1';
    signal h_areset_stm_sig : std_logic := '1';
    signal clk_a_stm_sig_stop : std_logic := '0';
    signal clk_av_stm_sig_stop : std_logic := '0';
    signal clk_ac_stm_sig_stop : std_logic := '0';
    signal clk_q_stm_sig_stop : std_logic := '0';
    signal clk_qv_stm_sig_stop : std_logic := '0';
    signal clk_qc_stm_sig_stop : std_logic := '0';

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

        -- Driving gnd for busIn signals

        busIn_writedata_stm <= (others => '0');
        busIn_address_stm <= (others => '0');
        busIn_write_stm <= (others => '0');
        busIn_read_stm <= (others => '0');
        -- Driving gnd for busOut signals

        busOut_readdatavalid_stm <= (others => '0');
        busOut_readdata_stm <= (others => '0');
        busOut_waitrequest_stm <= (others => '0');
        -- Generating stimulus for a
        a_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_xIn : text open read_mode is "decimation_filter/decimation_filter_FilterSystem_DecimatingFIR1_xIn.stm";
            variable xIn_0_int_0 : Integer;
            variable xIn_0_temp : std_logic_vector(16 downto 0);

        begin
            -- initialize all outputs to 0
            a_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            while true loop
            
                -- (ports connected to a)
                IF (endfile(data_file_xIn)) THEN
                    clk_a_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_xIn, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, xIn_0_int_0);
                    xIn_0_temp(16 downto 0) := std_logic_vector(to_unsigned(xIn_0_int_0, 17));
                    a_stm <= xIn_0_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;
        -- Generating stimulus for av
        av_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_xIn : text open read_mode is "decimation_filter/decimation_filter_FilterSystem_DecimatingFIR1_xIn.stm";
            variable xIn_v_int_0 : Integer;
            variable xIn_v_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            av_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            while true loop
            
                -- (ports connected to av)
                IF (endfile(data_file_xIn)) THEN
                    clk_av_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_xIn, L);
                    
                    read(L, xIn_v_int_0);
                    xIn_v_temp(0 downto 0) := std_logic_vector(to_unsigned(xIn_v_int_0, 1));
                    av_stm <= xIn_v_temp;
                    read(L, dummy_int);
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;
        -- Generating stimulus for ac
        ac_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_xIn : text open read_mode is "decimation_filter/decimation_filter_FilterSystem_DecimatingFIR1_xIn.stm";
            variable xIn_c_int_0 : Integer;
            variable xIn_c_temp : std_logic_vector(7 downto 0);

        begin
            -- initialize all outputs to 0
            ac_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            while true loop
            
                -- (ports connected to ac)
                IF (endfile(data_file_xIn)) THEN
                    clk_ac_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_xIn, L);
                    
                    read(L, dummy_int);
                    read(L, xIn_c_int_0);
                    xIn_c_temp(7 downto 0) := std_logic_vector(to_unsigned(xIn_c_int_0, 8));
                    ac_stm <= xIn_c_temp;
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;
        -- Generating stimulus for q
        q_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_qOut : text open read_mode is "decimation_filter/decimation_filter_FilterSystem_Scale3_qOut.stm";
            variable qOut_0_int_0 : Integer;
            variable qOut_0_temp : std_logic_vector(16 downto 0);

        begin
            -- initialize all outputs to 0
            q_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            while true loop
            
                -- (ports connected to q)
                IF (endfile(data_file_qOut)) THEN
                    clk_q_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_qOut, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, qOut_0_int_0);
                    qOut_0_temp(16 downto 0) := std_logic_vector(to_unsigned(qOut_0_int_0, 17));
                    q_stm <= qOut_0_temp;
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;
        -- Generating stimulus for qv
        qv_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_qOut : text open read_mode is "decimation_filter/decimation_filter_FilterSystem_Scale3_qOut.stm";
            variable qOut_v_int_0 : Integer;
            variable qOut_v_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            qv_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            while true loop
            
                -- (ports connected to qv)
                IF (endfile(data_file_qOut)) THEN
                    clk_qv_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_qOut, L);
                    
                    read(L, qOut_v_int_0);
                    qOut_v_temp(0 downto 0) := std_logic_vector(to_unsigned(qOut_v_int_0, 1));
                    qv_stm <= qOut_v_temp;
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;
        -- Generating stimulus for qc
        qc_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_qOut : text open read_mode is "decimation_filter/decimation_filter_FilterSystem_Scale3_qOut.stm";
            variable qOut_c_int_0 : Integer;
            variable qOut_c_temp : std_logic_vector(7 downto 0);

        begin
            -- initialize all outputs to 0
            qc_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            while true loop
            
                -- (ports connected to qc)
                IF (endfile(data_file_qOut)) THEN
                    clk_qc_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_qOut, L);
                    
                    read(L, dummy_int);
                    read(L, qOut_c_int_0);
                    qOut_c_temp(7 downto 0) := std_logic_vector(to_unsigned(qOut_c_int_0, 8));
                    qc_stm <= qOut_c_temp;
                    read(L, dummy_int);
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

    clk_stm_sig_stop <= clk_a_stm_sig_stop OR clk_av_stm_sig_stop OR clk_ac_stm_sig_stop OR clk_q_stm_sig_stop OR clk_qv_stm_sig_stop OR clk_qc_stm_sig_stop OR '0';


    END normal;
