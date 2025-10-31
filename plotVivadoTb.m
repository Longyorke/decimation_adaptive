clc; clear; close all;


% File path
file_path = ".\decimation_adaptive_vivado\decimation_adaptive_vivado.sim\sim_1\behav\xsim\output_error_data.txt";
fid = fopen(file_path, 'r');
if fid == -1
    error('Unable to open the file');
end

% Initialize arrays
time_data = [];
observedSignal = [];
desiredSignal = [];
filterOut_out1 = [];
filterError_signal1 = [];
filterWeights_oldCoeff = [];
stepSize = [];

% Read file
while ~feof(fid)
    line = fgetl(fid);
    if contains(line, 'time')
        tokens = regexp(line, ...
            'time\s+(\d+)\s+\|\s+observedSignal:\s+([0-9a-fA-F]+)\s+\|\s+desiredSignal:\s+([0-9a-fA-F]+)\s+\|\s+filterOut_out1:\s+([0-9a-fA-F]+)\s+\|\s+filterError_signal1:\s+([0-9a-fA-F]+)\s+\|\s+filterWeights_oldCoeff:\s+([0-9a-fA-F]+)\s+\|\s+stepSize:\s+([0-9a-fA-F]+)', ...
            'tokens');
        if ~isempty(tokens)
            data = tokens{1};
            t = str2double(data{1});
            obs_hex = data{2};
            des_hex = data{3};
            out1_hex = data{4};
            err1_hex = data{5};
            coeff_hex = data{6};
            step_hex = data{7};

            % Convert hex to signed decimals
            obs_dec   = hex2dec_signed(obs_hex, 24);  % sfix24_En13
            des_dec   = hex2dec_signed(des_hex, 24);
            out1_dec  = hex2dec_signed(out1_hex, 35); % sfix35_En20
            err1_dec  = hex2dec_signed(err1_hex, 31); % sfix31_En16
            coeff_dec = hex2dec_signed(coeff_hex, 32);% sfix32_En21
            step_dec  = hex2dec_signed(step_hex, 16); % assume stepSize is sfix16 (can adjust)

            % Append
            time_data(end+1) = t;
            observedSignal(end+1) = obs_dec;
            desiredSignal(end+1) = des_dec;
            filterOut_out1(end+1) = out1_dec;
            filterError_signal1(end+1) = err1_dec;
            filterWeights_oldCoeff(end+1) = coeff_dec;
            stepSize(end+1) = step_dec;
        end
    end
end
fclose(fid);

% Only keep samples with time <= 8*10^8 ns
time_limit_ns = 8e8;
valid_idx = find(time_data <= time_limit_ns);

% Slice all arrays accordingly
time_data = time_data(valid_idx);
observedSignal = observedSignal(valid_idx);
desiredSignal = desiredSignal(valid_idx);
filterOut_out1 = filterOut_out1(valid_idx);
filterError_signal1 = filterError_signal1(valid_idx);
filterWeights_oldCoeff = filterWeights_oldCoeff(valid_idx);
stepSize = stepSize(valid_idx);


% Limit data length
N = min(3000, length(time_data));
T = time_data(end-N+1:end);

% Convert coeff to binary
bin_matrix = zeros(32, N);
for i = 1:N
    val = filterWeights_oldCoeff(end-N+i);
    if val < 0
        val = 2^32 + val;
    end
    bin_matrix(:, i) = dec2bin(val, 32)' == '1';
end
bin_22bits = bin_matrix(11:32, :);  % bits 1~22

% Plot
figure('Name','Adaptive Filter Signals','NumberTitle','off', 'Color', 'w');
tiledlayout(7,1, 'TileSpacing','none', 'Padding','tight');

vivadoGreen = [0, 1, 0];
signalList = {observedSignal, desiredSignal, filterOut_out1, filterError_signal1, stepSize};
labels = {
    {'Observed Signal', '(sfix24\_En13)'},
    {'Desired Signal',  '(sfix24\_En13)'},
    {'Filter Out', '(sfix35\_En20)'},
    {'Result', '(sfix31\_En16)'},
    {'Step-Size', '(assumed sfix16)'}
    };

for i = 1:5
    nexttile;
    plot(T, signalList{i}(end-N+1:end), 'Color', vivadoGreen);
    plot(T, signalList{i}(end-N+1:end), 'Color', vivadoGreen, 'LineWidth', 1.2);
    set(gca, ...
        'Color', 'k', ...
        'XColor', 'k', ...
        'YColor', 'k', ...
        'GridColor', [0.5 0.5 0.5], ...
        'LineWidth', 1.2, ...
        'YAxisLocation','left');  % force scientific notation to left
    xlim([T(1), T(end)]);
    ylabel(labels{i}, 'Color', 'k');
    grid on;
end

% Binary representation
nexttile([2 1]);
imagesc(T, 1:22, bin_22bits);
colormap([0 0 0; 0 1 0]);  % black = 0, green = 1
set(gca, ...
    'Color', 'k', ...
    'XColor', 'k', ...
    'YColor', 'k', ...
    'LineWidth', 1.2, ...
    'YAxisLocation','left');  % keep scientific notation left
xlabel('Time (ns)', 'Color', 'k');
ylabel({'Filter Weights Coeff', '(bit 1~22)'}, 'Color', 'k');
yticks(1:22);
yticklabels(22:-1:1);
xlim([T(1), T(end)]);
colorbar('Color', 'k');

disp('Data extraction and plotting completed.');


% Helper function
function dec_val = hex2dec_signed(hex_str, word_length)
val = uint64(hex2dec(hex_str));
if bitget(val, word_length) == 1
    dec_val = double(val) - 2^word_length;
else
    dec_val = double(val);
end
end
