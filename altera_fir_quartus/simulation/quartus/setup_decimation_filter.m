%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% File: setup_decimation_filter.m
% Description: Script to set variables in Matlab workspace to configure decimation_filter model
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 检查是否存在OverrideClockRate变量，如果存在则将其值赋给decimation_filter.ClockRate，否则将ClockRate设为默认值240.00。
if exist('OverrideClockRate', 'var')
    decimation_filter.ClockRate = OverrideClockRate;
else
    decimation_filter.ClockRate = 32.768;
end

% 设置decimation_filter的ChanCount为20，表示通道数目为20。
decimation_filter.ChanCount     = 1;

% 设置ClockMargin为0.0，表示时钟的裕度为0。
decimation_filter.ClockMargin   = 0.0;

% 设置SampleRate为，表示采样率为MHz。
% decimation_filter.SampleRate    = 0.032768;
decimation_filter.SampleRate    = 0.016;

% 计算Period：ClockRate与SampleRate的比值，即时钟周期。
decimation_filter.Period        = decimation_filter.ClockRate / decimation_filter.SampleRate;

% 设置FilterLength为49，表示滤波器的长度为49。
decimation_filter.FilterLength  = 49;

% 设置Decimation为5，表示去采样因子为5。
decimation_filter.Decimation    = 8;

% 设置SampleTime为1，表示采样时间为1秒。
% decimation_filter.SampleTime    = 1/32.768e3;
decimation_filter.SampleTime    = 1/16e3;

% 下面这一行被注释掉的代码是设置SampleTime为基于时钟速率和微秒的实际时间采样时间。取消注释后会使用实际的时间模拟。
% decimation_filter.SampleTime    = 1/(decimation_filter.ClockRate * 1e6);   % uncomment this line to simulate the model with realworld time

% 计算SimulationTime，表示仿真时间，等于150000乘以SampleTime。
decimation_filter.SimulationTime = 15 * decimation_filter.SampleTime;

% 输出所有设定的参数，用于调试和确认设置。格式化输出各个参数的值。
disp(['Parameters set from setup_decimation_filter.m: FilterLength=' num2str(decimation_filter.FilterLength) '; ChanCount = ' num2str(decimation_filter.ChanCount) '; ClockRate = ' num2str(decimation_filter.ClockRate) '; ClockMargin = ' num2str(decimation_filter.ClockMargin) '; SampleRate = ' num2str(decimation_filter.SampleRate) '; Decimation = ' num2str(decimation_filter.Decimation) ';']);

% 以下是派生参数，表示基于前面设置的变量计算出来的其他参数。
% 注意：不要修改这些派生参数！！！

% 计算ChanWireCount：每个通道的线数。公式是将ChanCount除以Period并向上取整。
decimation_filter.ChanWireCount = ceil(decimation_filter.ChanCount / decimation_filter.Period);

% 计算ChanCycleCount：每个通道周期数。公式是将ChanCount除以ChanWireCount并向上取整。
decimation_filter.ChanCycleCount = ceil(decimation_filter.ChanCount / decimation_filter.ChanWireCount);

% 计算InputPeriod：输入的周期，等于Period向上取整。
decimation_filter.InputPeriod  = ceil(decimation_filter.Period);

% 计算OutputPeriod：输出的周期，等于Period乘以Decimation后向上取整。
decimation_filter.OutputPeriod = ceil(decimation_filter.Period * decimation_filter.Decimation);
