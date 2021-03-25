/******************************************************************************
*
*  NSSDC/CDF           Create an example CDF using the New Standard Interface
*                      that was introduced in CDF 3.1.  
*
*  History:
*
*   V1.0  10-Jan-2006, D. Han              Original version
*   V1.1  2021-03-23, C. Piker             D adaptation
*
******************************************************************************/

import std.stdio;
import core.stdc.config;
import core.stdc.stdlib;

import deimos.cdf;


// MAIN 
int main () {

	CDFid id;            /* CDF identifier. */
	CDFstatus status;    /* CDF completion status. */

	string[] title = ["CDF title", "Author: CDF"];
	short[181] lat;
	int   time, i; 
	int[]  image;
	c_long  TimeVarNum, LatVarNum, ImageVarNum, attrNum, recNum, titleAttrNum;

	c_long[2] dimIndices, dimCounts, dimInterval, dimSizes, dimVarys;

	c_long cType;                     /* Compression type */
	c_long[CDF_MAX_PARMS] cParms;     /* Compression parameters */

	assert(short.sizeof == CDF_INT2);	/* Test if short matches with CDF_INT2 */
	assert(int.sizeof == CDF_INT4);	/* Test if int matches with CDF_INT4 */

	//Create the CDF.
	status = CDFcreateCDF ("example1".ptr, &id);
	if (status != CDF_OK) StatusHandler (status);

	//Create zVariables.
	status = CDFcreatezVar (id, 
		"Time".ptr,    /* Variable name - case sensitive */
		CDF_INT4,  /* Data type */
		1L,        /* Number of elements */
		0L,        /* Dimentionality     */
		null,      /* Dummy dimension sizes since dim = 0 */
		VARY,      /* Record variance */
		null,      /* Dimension variance */
		&TimeVarNum
	);
	if (status != CDF_OK) StatusHandler (status);

	dimSizes[0] = 181;
	dimVarys[0] = VARY;
	dimVarys[1] = VARY;
	status = CDFcreatezVar (id, "Latitude".ptr, CDF_INT2, 1L, 1L, dimSizes.ptr,
	                         VARY, dimVarys.ptr, &LatVarNum);
	if (status != CDF_OK) StatusHandler (status);

	dimSizes[0] = 10;
	dimSizes[1] = 20;
	dimVarys[0] = VARY;
	dimVarys[1] = VARY;
	status = CDFcreatezVar (id, "Image".ptr, CDF_INT4, 1L, 2L, dimSizes.ptr,
   	                      VARY, dimVarys.ptr, &ImageVarNum);
	if (status != CDF_OK) StatusHandler (status);

	// Define compression for the 'Image' variable. 
	cType = GZIP_COMPRESSION;
	cParms[0] = 5;              /* GZIP compression level */
	status = CDFsetzVarCompression (id, ImageVarNum, cType, cParms.ptr);
	if (status != CDF_OK) StatusHandler (status);

	// Create global and variable attributes.

	status = CDFcreateAttr (id, "TITLE".ptr, GLOBAL_SCOPE, &titleAttrNum);
	if (status != CDF_OK) StatusHandler (status);

	status = CDFcreateAttr (id, "FIELDNAM".ptr, VARIABLE_SCOPE, &attrNum);
	if (status != CDF_OK) StatusHandler (status);

	status = CDFcreateAttr (id, "UNITS".ptr, VARIABLE_SCOPE, &attrNum);
	if (status != CDF_OK) StatusHandler (status);

	// Write TITLE gAttribute gEntry.
	status = CDFputAttrgEntry (id, titleAttrNum, 
	                           0,        /* Attribute entry number */
	                           CDF_CHAR, cast(c_long)title[0].length, title[0].ptr); 
	if (status != CDF_OK) StatusHandler (status);

	status = CDFputAttrgEntry (id, titleAttrNum, 
                           1,        /* Attribute entry number */
                           CDF_CHAR, cast(c_long)title[1].length, title[1].ptr); 
	if (status != CDF_OK) StatusHandler (status);

	//Write vAttribute zEntries for 'Time' zVariable.

	status = CDFputAttrzEntry (id, CDFgetAttrNum(id,"FIELDNAM".ptr), 
                           CDFvarNum(id,"Time".ptr), CDF_CHAR, 19,
                           "Time of observation".ptr);
	if (status != CDF_OK) StatusHandler (status);

	status = CDFputAttrzEntry (id, CDFgetAttrNum(id,"UNITS".ptr), 
                           CDFvarNum(id,"Time".ptr), CDF_CHAR, 11,
                           "Hour/Minute".ptr);

	// Write data for 'Time' zVariable.
	recNum = 0L;
	time = 23;
	status = CDFputzVarRecordData (id, TimeVarNum, recNum, &time);
	if (status != CDF_OK) StatusHandler (status);
	recNum = 1L;
	time = 24;
	status = CDFputzVarRecordData (id, TimeVarNum, recNum, &time);
	if (status != CDF_OK) StatusHandler (status);
	
	
	// Write data for 'Latitude' zVariable.
	dimIndices[0] = 0;
	dimCounts[0] = 181;
	dimInterval[0] = 1;
	for (short s=-90; s <= 90; s++)
	   lat[s+90] = s;

	status = CDFhyperPutzVarData (id, LatVarNum,
		0,           /* record start */
		1,           /* # of records to write */
		1,           /* record interval */
		dimIndices.ptr,   /* dimension dimIndices */
		dimCounts.ptr,    /* dimension counts */
		dimInterval.ptr,  /* dimension interval */
		lat.ptr
	);
                              
	if (status != CDF_OK) StatusHandler (status);


	// Write data for 'Image' zVariable.
	dimIndices[0] = 0;
	dimIndices[1] = 0;
	dimCounts[0] = 10; 
	dimCounts[1] = 20;
	dimInterval[0] = 1;
	dimInterval[1] = 1;

	image.length = 600;
	for (i=0; i < 600; i++)     /* Load 3 records of data */
	   image[i] = i;

	status = CDFhyperPutzVarData(id, ImageVarNum,
		0,           /* record start */
		3,           /* # of records to write */
		1,           /* record interval */
		dimIndices.ptr,   /* dimension dimIndices */
		dimCounts.ptr,    /* dimension counts */
		dimInterval.ptr,  /* dimension interval */
		image.ptr
	);

	if (status != CDF_OK) StatusHandler (status);


	// Close CDF 
	status = CDFcloseCDF (id);	
	if (status != CDF_OK)  StatusHandler (status);
	
	return 0;
}

// Status handler ////////////////////////////////////////////////////////////

void StatusHandler (CDFstatus status)
{
	char[CDF_ERRTEXT_LEN+1] message;

	if (status < CDF_WARN) {
		writeln ("An error has occurred, halting...");
		CDFgetStatusText (status, message.ptr);
		writeln (message);
		exit(1);
	}
	else{
		if (status < CDF_OK) {
			writeln ("Warning, function may not have completed as expected...");
			CDFgetStatusText (status, message.ptr);
			writeln (message);
		}
  		else{
			if (status > CDF_OK) {
				writeln ("Function completed successfully, but be advised that...");
				CDFgetStatusText (status, message.ptr);
				writeln (message);
			}
		}
	}
}
