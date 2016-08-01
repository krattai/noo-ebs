/*
 ============================================================================
 Name        : msg_test.c
 Date        : Jan. 24/2016
 Author      : Kevin Rattai
 Version     : 0.0.001
 Copyright   : working license: The BSD 2-Clause License -> http://opensource.org/licenses/bsd-license.php
 Description : test program to check mqtt message processing

 Important to note, in order to get certain aspects of this code working, using the paho mqtt client code for testing.
 For tests, remember to include LIB path as shown in -> https://forums.aws.amazon.com/thread.jspa?threadID=218892

 export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$PWD

 And as perm solution, copy to /usr/lib
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
