# Minus the Address Value in CWC Cheat Table

# What is This Script for

You can minus the address in your CWC cheat table by a certain hex number once.

# Why do you need it

Some CWC cheat codes do not work directly in the PPSSPP. For example, *The Way of Samurai 2* running on PPSSPP does not support the cheat code for PSP, you need to minus the address value by 70 (hexadecimal) first.

# How to use
1. Download the files to your local folder and put your CWC file in the same folder.
1. Launch MATLAB, and change the directory to this folder.
1. In the command window, type the command: `cwchexminus_matlab('<cwc file name>')`.
1. The result CWC file will appear in the same folder named 'result'.

If you use Octave:
1. Follow the first step mentioned before.
2. Launch Octave and go to the folder where you put your CWC file and the m-file.
3. In Octave, type the command: `cwchexminus_octave('<cwc file name>')`.
1. The rest is the same as above.

# If you want more...
## I want to add instead of minus
Just replace the - for + in line 61 in the cwchexminus_matlab.m or line 73 of the cwchexminus_octave.m.
