# Minus the Address Value in your CWC Cheat Table
## What is This Script for
With this script, you can minus the address in your CWC cheat table by certain hex number at one time.
## Why you need it
Some CWC cheat code does not work directly in the PPSSPP. E.g., the game *the way of samurai 2* run in the PPSSPP does not support the cheat code directly, you need to minus the address value by 70 (hexadecimal).
## How to use
1. download the files to your local folder and put your cwc file in the same folder.
2. launch the `Matlab`, change the directory to this fold.
3. type the command `cwchexminus_matlab('<cwc file name>')`
1. the result cwc file will appear in the same folder named with `result`.

If you use `Octave`:
1. follow the first step mentioned before.
1. launch the `Octave` and go to the folder where you put your cwc file and the m-file.
1. in `Octave` type the command `cwchexminus_octave('<cwc file name>')`.
1. the rest is same as above.
## If you want more...
### I want add instead of minus
Just replace the `-` for `+` in the line 61 in the `cwchexminus_matlab.m` or the line 73 of the `cwchexminus_octave.m`.
