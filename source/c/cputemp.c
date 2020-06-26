/****************************************************************************************
* Include files
****************************************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>


/****************************************************************************************
* Function prototypes
****************************************************************************************/
float get_cpu_temp(void);


/************************************************************************************//**
** \brief     Program to demonstrate how to obtain the current value of the CPU
**            temperature.
** \details   You can build this program with the command:
**              gcc cputemp.c -o cputemp
** \return    Program exit code.
**
****************************************************************************************/
int main(void)
{
  printf("Current CPU temperature is %.2f degrees Celcius\n", get_cpu_temp());
  return 0;
} /*** end of main ***/


/************************************************************************************//**
** \brief     Obtains the current value of the CPU temperature.
** \return    Current value of the CPU temperature if successful, zero value otherwise.
**
****************************************************************************************/
float get_cpu_temp(void)
{
  float   result;
  FILE  * f;
  char    line[256] = "0";
  char  * pos;

  /* Initialize the result. */  
  result = 0.0f;
  /* Open the file for reading. */
  f = fopen("/sys/class/thermal/thermal_zone0/temp", "r");
  /* Only continue if the file could be opened. */
  if (f != NULL)
  {
    /* The first line in this file holds the CPU temperature as an integer times 1000.
     * Read the first line and remove the newline character at the end of the string.
     */
    fgets(line, sizeof(line)/sizeof(line[0]), f);
    /* Close the file now that we are done with it. */
    fclose(f);
  }
  
  /* The read line should now contain digits followed by a newline character.
   * Make it a string by locating the newline character and replacing it with
   * a string termination character.
   */
  pos = strchr(line, '\n');
  /* Was the newline character found? */
  if (pos != NULL)
  {
    /* Replace it with a string termination character. */
    *pos = '\0';
  }
  /* No newline character found so something is wrong with the string. */
  else
  {
    /* Reset the line to a safe dummy value. */
    strcpy(line, "0");
  }

  /* Verify that the line now contains just digits. */
  pos = line;
  while (*pos != '\0')
  {
    if (!isdigit(*pos))
    {
      /* Reset the line to a safe dummy value. */
      strcpy(line, "0");
      break;
    }
    pos++;
  }

  /* Convert the line string to an integer, divide by zero while converting
   * to a float.
   */
  result = ((float)atoi(line)) / 1000;
  /* Give the result back to the caller. */
  return result;
} /*** end of get_cpu_temp ***/
