%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% File: setup_decimation_filter.m
% Description: Script to set variables in Matlab workspace to configure dspb_fird model
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 检查是否存在OverrideClockRate变量，如果存在则将其值赋给dspb_fird.ClockRate，否则将ClockRate设为默认值240.00。
if exist('OverrideClockRate', 'var')
    dspb_fird.ClockRate = OverrideClockRate;
else
    dspb_fird.ClockRate = 240.00;
end

% 设置dspb_fird的ChanCount为20，表示通道数目为20。
dspb_fird.ChanCount     = 20;

% 设置ClockMargin为0.0，表示时钟的裕度为0。
dspb_fird.ClockMargin   = 0.0;

% 设置SampleRate为12，表示采样率为12。
dspb_fird.SampleRate    = 12;

% 计算Period：ClockRate与SampleRate的比值，即时钟周期。
dspb_fird.Period        = dspb_fird.ClockRate / dspb_fird.SampleRate;

% 设置FilterLength为49，表示滤波器的长度为49。
dspb_fird.FilterLength  = 49;

% 设置Decimation为5，表示去采样因子为5。
dspb_fird.Decimation    = 5;

% 设置SampleTime为1，表示采样时间为1秒。
dspb_fird.SampleTime    = 1/128e3;

% 下面这一行被注释掉的代码是设置SampleTime为基于时钟速率和微秒的实际时间采样时间。取消注释后会使用实际的时间模拟。
% dspb_fird.SampleTime    = 1/(dspb_fird.ClockRate * 1e6);   % uncomment this line to simulate the model with realworld time

% 计算SimulationTime，表示仿真时间，等于150000乘以SampleTime。
dspb_fird.SimulationTime = 150000 * dspb_fird.SampleTime;

% 输出所有设定的参数，用于调试和确认设置。格式化输出各个参数的值。
disp(['Parameters set from setup_dspb_fird.m: FilterLength=' num2str(dspb_fird.FilterLength) '; ChanCount = ' num2str(dspb_fird.ChanCount) '; ClockRate = ' num2str(dspb_fird.ClockRate) '; ClockMargin = ' num2str(dspb_fird.ClockMargin) '; SampleRate = ' num2str(dspb_fird.SampleRate) '; Decimation = ' num2str(dspb_fird.Decimation) ';']);

% 以下是派生参数，表示基于前面设置的变量计算出来的其他参数。
% 注意：不要修改这些派生参数！！！

% 计算ChanWireCount：每个通道的线数。公式是将ChanCount除以Period并向上取整。
dspb_fird.ChanWireCount = ceil(dspb_fird.ChanCount / dspb_fird.Period);

% 计算ChanCycleCount：每个通道周期数。公式是将ChanCount除以ChanWireCount并向上取整。
dspb_fird.ChanCycleCount = ceil(dspb_fird.ChanCount / dspb_fird.ChanWireCount);

% 计算InputPeriod：输入的周期，等于Period向上取整。
dspb_fird.InputPeriod  = ceil(dspb_fird.Period);

% 计算OutputPeriod：输出的周期，等于Period乘以Decimation后向上取整。
dspb_fird.OutputPeriod = ceil(dspb_fird.Period * dspb_fird.Decimation);
