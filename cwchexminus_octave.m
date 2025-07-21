%% Author: walala <walala@DESKTOP-3HOJP2R>
%% Created: 2025-03-11
%% input is a cwc cheat code. and output is code file with the address minused 0x70.
function cwchexminus_octave (x)
  file = fopen(x);
  if file == -1
    error("fail to open the file!");
  else
    line_num = fskipl(file,inf);
    frewind(file);
    resource = cell(1,line_num);
%% put the file content into a cell
    for i = 1:line_num
      resource{i}=fgetl(file);
    endfor
    fclose(file);
  endif
  index = [0];
  line_num = length(resource);
%% grap the index of L_row (address row, exclude the comment) 
  for i = 1:line_num
    if resource{i}(2) == "L"
      index = [index i];
    end
  end
  if length(index) == 1
    error("There is no available address!");
  else
    index = index(2:end); % delete the initial num
  end
%% obtain L row cell
  Lrowcell = cell(1,length(index));
  for i = 1:length(index)
    Lrowcell{i} = resource{index(i)};
  end
%% spilt the L row cell
  Lrowcell = cellfun(@strsplit,Lrowcell,"Uniformoutput",false);
  addresscell = cell(1,length(index));
  for i = 1:length(index)
    addresscell{i} = Lrowcell{i}{2};
  end
%% minus the addresscell
  address = hexminus(addresscell,'70');
  addresscell = cellstr(address);
%% newaddresscell = transpose(a);
%% put new addresscell to the Lrowcell
  for i = 1:length(index)
    Lrowcell{i}{2} = addresscell{i};
  end
%% join each element in Lrowcell
  Lrowcell = cellfun(@strjoin,Lrowcell,"Uniformoutput",false);
%% put back new Lrowcell into the resource
  for i = 1:length(index)
    resource{index(i)} = Lrowcell{i};
  end
%% write resource to a file
  fid = fopen("new",'w');
  for i = 1:line_num
    fprintf(fid,"%s\n",resource{i});
  end
  fclose(fid);
end


%% Author: walala <walala@DESKTOP-3HOJP2R>
%% Created: 2025-03-11
%% input x and y are char refering to hex number, and the output is a hex result with "0x" prefixed. if the result's length is less than 8,and zeros will be attached at the beginning.
%% x can be cell string. and the result is a cell string.
function finalresult = hexminus (x, y)
  x = trim0x(x);
  y = trim0x(y);
  if ischar(x)
      decresult = hex2dec(x)-hex2dec(y);
      noinitial_hexresult = dec2hex(decresult);
      noinitial_hexresult = addzeros(noinitial_hexresult);
      cel_initial_result = strcat('0x',noinitial_hexresult);
      finalresult = char(cel_initial_result);
  elseif iscellstr(x)
      decresult = cell(1,length(x));
      noinitial_hexresult = cell(1,length(x));
      for i = 1:length(x)
          decresult{i} = hex2dec(x{i})-hex2dec(y);
          noinitial_hexresult{i} = dec2hex(decresult{i});
      end
          noinitial_hexresult = addzeros(noinitial_hexresult);
          cel_initial_result = cellfun(@(x) strcat('0x',x),noinitial_hexresult,"UniformOutput",false);
          finalresult = cel_initial_result;
  end
end

function trimresult = trim0x(x)
  if iscellstr(x)
    for i = 1:length(x)
        if x{i}(1)=="0"&&x{i}(2)=="x"
          x{i}=x{i}(3:end);
        end
    end
  elseif ischar(x)
    if x(1)=="0"&&x(2)=="x"
      x = x(3:end);
    end
  else
    error("the input must be string or cellstring!");
  end
  trimresult = x;
end
function [y] = addzeros(x)
    %UNTITLED2 Summary of this function goes here
    %   Detailed explanation goes here
    if iscellstr(x)
        for i = 1:length(x)    
            if length(x{i})<8
            z = num2str(zeros(1,8-length(x{i})));
            z = strrep(z," ","");
            z = char(z);
            x{i}=strcat(z,x{i});
           end
        end
    end
    if ischar(x)
        if length(x)<8
            z = num2str(zeros(1,8-length(x)));
            z = strrep(z," ","");
            z = char(z);
            x=strcat(z,x);
        end
    end
    y = x;
end
