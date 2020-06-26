program cputemp;

{$mode objfpc}{$H+}

//***************************************************************************************
// Includes
//***************************************************************************************
uses
  SysUtils;


//***************************************************************************************
// NAME:           get_cpu_temp
// RETURN VALUE:   Current value of the CPU temperature if successful, zero value
//                 otherwise.
// DESCRIPTION:    Obtains the current value of the CPU temperature.
//
//***************************************************************************************
function get_cpu_temp: real;
var
  f: text;
  line: string;
begin
  // Initialize the result.
  result := 0.0;

  // Initialize line to a safe dummy value.
  line := '0';

  // Only continue if the file exists.
  if FileExists('/sys/class/thermal/thermal_zone0/temp') then
  begin
    // Open the file for reading.
    Assign(f, '/sys/class/thermal/thermal_zone0/temp');
    Reset(f);
    // Read the first line from the file and then close it again.
    readln(f, line);
    Close(f);
  end;

  // Convert the string with the CPU temperature to a float in degrees Celsius.
  try
    result := StrToInt(line) / 1000;
  except
    result := 0.0;
  end;
end; //*** end of get_cpu_temp ***


//***************************************************************************************
// NAME:           main
// RETURN VALUE:   Current value of the CPU temperature if successful, zero value
//                 otherwise.
// DESCRIPTION:    Program to demonstrate how to obtain the current value of the CPU
//                 temperature. You can build this program with the command:
//                   fpc cputemp.pas -ocputemp
//
//***************************************************************************************
begin
  writeln('Current CPU temperature is ' +
          FormatFloat('0.00', get_cpu_temp) +
          ' degrees Celsius.');
  ExitCode := 0;
end. //*** end of main ***/

