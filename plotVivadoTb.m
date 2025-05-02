clc; clear; close all;

% File path to the simulation output text
file_path = ".\decimation_adaptive_vivado\decimation_adaptive_vivado.sim\sim_1\behav\xsim\output_error_data.txt";
fid = fopen(file_path, 'r');
if fid == -1
    error('Unable to open the file');
end

% Initialize data arrays
time_data = [];
filterOut_out1 = [];
filterError_signal1 = [];
filterWeights_oldCoeff = [];

% Read the file line by line
while ~feof(fid)
    line = fgetl(fid);
    if contains(line, 'time')
        % Use regular expression to extract numerical values
        tokens = regexp(line, ...
            'time\s+(\d+)\s+filterOut_out1:\s+([0-9a-fA-F]+)\s+filterError_signal1:\s+([0-9a-fA-F]+)\s+filterWeights_oldCoeff:\s+([0-9a-fA-F]+)', ...
            'tokens');
        if ~isempty(tokens)
            data = tokens{1};
            t = str2double(data{1});
            out1_hex = data{2};
            err1_hex = data{3};
            coeff_hex = data{4};

            % Convert hexadecimal strings to signed decimal integers
            out1_dec = hex2dec_signed(out1_hex, 35);   % 35-bit signed
            err1_dec = hex2dec_signed(err1_hex, 31);   % 31-bit signed
            coeff_dec = hex2dec_signed(coeff_hex, 32); % 32-bit signed

            % Append to data arrays
            time_data(end+1) = t;
            filterOut_out1(end+1) = out1_dec;
            filterError_signal1(end+1) = err1_dec;
            filterWeights_oldCoeff(end+1) = coeff_dec;
        end
    end
end
fclose(fid);

% Plot the signals
figure;

subplot(3,1,1);
plot(time_data(end-3000:end), filterOut_out1(end-3000:end));
xlabel('Time (ns)');
ylabel('filterOut\_out1');
title('filterOut\_out1');
grid on;

subplot(3,1,2);
plot(time_data(end-3000:end), filterError_signal1(end-3000:end));
xlabel('Time (ns)');
ylabel('sfix35en20');
title('filterError\_signal1');
grid on;

subplot(3,1,3);
plot(time_data(end-3000:end), filterWeights_oldCoeff(end-3000:end));
xlabel('Time (ns)');
ylabel('sfix32en21');
title('filterWeights\_oldCoeff');
grid on;

disp('Data extraction and plotting completed.');

% Function to convert a hexadecimal string to signed decimal based on bit width
function dec_val = hex2dec_signed(hex_str, word_length)
    val = uint64(hex2dec(hex_str)); % Convert hex to unsigned 64-bit
    if bitget(val, word_length) == 1
        % If MSB is 1, it's a negative number in two's complement
        dec_val = double(val) - 2^word_length;
    else
        dec_val = double(val);
    end
end
