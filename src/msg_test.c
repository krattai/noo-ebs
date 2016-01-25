/*
 ============================================================================
 Name        : noo-ebs.c
 Author      : Kevin Rattai
 Version     : 0.0.001
 Copyright   : working license: The BSD 2-Clause License -> http://opensource.org/licenses/bsd-license.php
 Description : main program for noo-ebs in C, Ansi-style
 ============================================================================
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* inline function prototypes */
int startup(int);
int shutdown(void);

int main(int argc, char *argv[]) {

    if(startup(argc)) {

    	/* pass on ptr arry sent as follows */
    	explode(argc, argv);

    }

    shutdown();

    return EXIT_SUCCESS;
}

int startup(int check)
{
	/*	startup protocols */

	int yesno = 1;

    if (check < 2) {
        printf("No arguments.  New environment.\n\n");

    	yesno = 0;
    }

	return(yesno);
}

int shutdown(void)
{
	/*	shutdown protocols */

	int yesno = 1;

	return(yesno);
}
