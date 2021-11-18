% NOVA School of Science and Technology
% Department of Electrical and Computer Engineering
% IEEC course, fall 2021
% Bruno Guerreiro (bj.guerreiro@fct.unl.pt)

% Summary: octave script to simulate and show data from drone flight

% Set controller paremeters:

%%%% ONLY CHANGE THIS CODE (adding new parameter lines below)

kp=1; kv=0.5; % results: underdamped, oscilatory, ~60% overshoot, slow, stable
%kp=1; kv=5; % results: overdamped, slow, stable
%kp=??; kv=??; % results: CHANGE HERE the gains and summare the results

%%%% DO NOT CHANGE THE FOLLOWING CODE OR OTHER FUNCTIONS

% simulate and show results
simulate_drone;

% NOTE 1: to animate results, run in the command line: animate_drone;
% NOTE 2: to start all over from scratch run: clear all; close all; clc;
% NOTE 3: to overcome the limitations of run time of octave-online, when below 3 seconds, click on "add 15 seconds".