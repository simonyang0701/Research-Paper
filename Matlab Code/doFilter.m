function y = doFilter(x)
%DOFILTER Filters input x and returns output y.

% MATLAB Code
% Generated by MATLAB(R) 9.2 and the DSP System Toolbox 9.4.
% Generated on: 29-Jun-2018 13:36:59

%#codegen

% To generate C/C++ code from this function use the codegen command.
% Type 'help codegen' for more information.

persistent Hd;

if isempty(Hd)
    
    % The following code was used to design the filter coefficients:
    %
    % N    = 50;   % Order
    % F3dB = 20;   % 3-dB Frequency
    % Fs   = 200;  % Sampling Frequency
    %
    % h = fdesign.lowpass('n,f3db', N, F3dB, Fs);
    %
    % Hd = design(h, 'butter', ...
    %     'SystemObject', true);
    
    Hd = dsp.BiquadFilter( ...
        'Structure', 'Direct form II', ...
        'SOSMatrix', [1 2 1 1 -1.58870212934195 0.963743827865316; 1 2 1 1 ...
        -1.53322302328344 0.895167881446072; 1 2 1 1 -1.48178412853868 ...
        0.831585910854089; 1 2 1 1 -1.4341458309286 0.772701736675671; 1 2 1 1 ...
        -1.39007925915565 0.718232458428932; 1 2 1 1 -1.34936788777083 ...
        0.667910435940048; 1 2 1 1 -1.31180847159542 0.621484444352038; 1 2 1 1 ...
        -1.27721148327893 0.578720214976093; 1 2 1 1 -1.24540118910211 ...
        0.539400528989284; 1 2 1 1 -1.21621546823151 0.503324994020878; 1 2 1 1 ...
        -1.18950545653155 0.47030960387992; 1 2 1 1 -1.16513507684709 ...
        0.440186157952442; 1 2 1 1 -1.1429805025399 0.412801598096189; 1 2 1 1 ...
        -1.12292958924774 0.388017306256126; 1 2 1 1 -1.10488130068678 ...
        0.36570839471724; 1 2 1 1 -1.08874514729787 0.345763012233186; 1 2 1 1 ...
        -1.07444065119761 0.328081682669387; 1 2 1 1 -1.0618968468751 ...
        0.312576687830311; 1 2 1 1 -1.05105182408468 0.299171502443819; 1 2 1 1 ...
        -1.04185231719213 0.287800286565151; 1 2 1 1 -1.03425334365437 ...
        0.278407438713257; 1 2 1 1 -1.02821789320669 0.270947211685083; 1 2 1 1 ...
        -1.02371666858406 0.265383392069521; 1 2 1 1 -1.02072787812578 ...
        0.261689043892584; 1 2 1 1 -1.0192370803353 0.259846316482849], ...
        'ScaleValues', [0.093760424630841; 0.0904862145406585; ...
        0.0874504455788534; 0.0846389764367675; 0.0820382998183201; ...
        0.0796356370423055; 0.0774189931891551; 0.0753771829242908; ...
        0.0734998349717923; 0.0717773814473428; 0.0702010368370919; ...
        0.0687627702763385; 0.0674552738890719; 0.066271929252096; ...
        0.065206773507616; 0.0642544662338296; 0.0634102578679442; ...
        0.0626699602388023; 0.0620299195897839; 0.0614869923432541; ...
        0.0610385237647207; 0.0606823296195993; 0.0604166808713653; ...
        0.0602402914417011; 0.0601523090368864; 1]);
end

s = double(x);
y = step(Hd,s);

