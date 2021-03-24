# B.1 Original Standard Interface

CDFstatus CDFattrCreate (id, attrName, attrScope, attrNum)
CDFid id; /* in */
char *attrName; /* in */
long attrScope; /* in */
long *attrNum; /* out */

CDFstatus CDFattrEntryInquire (id, attrNum, entryNum, dataType, numElements)
CDFid id; /* in */
long attrNum; /* in */
long entryNum; /* in */
long *dataType; /* out */
long *numElements; /* out */

CDFstatus CDFattrGet (id, attrNum, entryNum, value)
CDFid id; /* in */
long attrNum; /* in */
long entryNum; /* in */
void *value; /* out */

CDFstatus CDFattrInquire (id, attrNum, attrName, attrScope, maxEntry)
CDFid id; /* in */
long attrNum; /* in */
char *attrName; /* out */
long *attrScope; /* out */
long *maxEntry; /* out */

long CDFattrNum (id, attrName)
CDFid id; /* in */
char *attrName; /* in */

CDFstatus CDFattrPut (id, attrNum, entryNum, dataType, numElements, value)
CDFid id; /* in */
long attrNum; /* in */
long entryNum; /* in */
long dataType; /* in */
long numElements; /* in */
void *value; /* in */

CDFstatus CDFattrRename (id, attrNum, attrName)
CDFid id; /* in */
long attrNum; /* in */
char *attrName; /* in */

CDFstatus CDFclose (id)
CDFid id; /* in */

CDFstatus CDFcreate (CDFname, numDims, dimSizes, encoding, majority, id)
char *CDFname; /* in */
long numDims; /* in */
long dimSizes[]; /* in */
long encoding; /* in */
long majority; /* in */
CDFid *id; /* out */

CDFstatus CDFdelete (id)
CDFid id; /* in */

CDFstatus CDFdoc (id, version, release, text)
CDFid id; /* in */
long *version; /* out */
long *release; /* out */
char text[CDF_DOCUMENT_LEN+1]; /* out */

CDFstatus CDFerror (status, message)
CDFstatus status; /* in */
char message[CDF_STATUSTEXT_LEN+1]; /* out */

CDFstatus CDFgetrVarsRecordData (id, numVars, varNames, varRecNum, buffer)
CDFid id; /* in */
long numVars; /* in */
char *varNames[]; /* in */
long varRecNum; /* in */
void *buffer[]; /* out */

CDFstatus CDFgetzVarsRecordData (id, numVars, varNames, varRecNum, buffer)
CDFid id; /* in */
long numVars; /* in */
char *varNames[]; /* in */
long varRecNum; /* in */
void *buffer[]; /* out */

CDFstatus CDFinquire (id, numDims, dimSizes, encoding, majority, maxRec,
numVars, numAttrs)
CDFid id; /* in */
long *numDims; /* out */
long dimSizes[CDF_MAX_DIMS]; /* out */
long *encoding; /* out */
long *majority; /* out */
long *maxRec; /* out */
long *numVars; /* out */
long *numAttrs; /* out */

CDFstatus CDFopen (CDFname, id)
char *CDFname; /* in */
CDFid *id; /* out */

CDFstatus CDFputrVarsRecordData (id, numVars, varNames, varRecNum, buffer)
CDFid id; /* in */
long numVars; /* in */
char *varNames[]; /* in */
long varRecNum; /* in */
void *buffer; /* in */

CDFstatus CDFputzVarsRecordData (id, numVars, varNames, varRecNum, buffer)
CDFid id; /* in */
long numVars; /* in */
char *varNames[]; /* in */
long varRecNum; /* in */
void *buffer[]; /* in */

CDFstatus CDFvarClose (id, varNum)
CDFid id; /* in */
long varNum; /* in */

CDFstatus CDFvarCreate (id, varName, dataType, numElements, recVariances,
dimVariances, varNum)
CDFid id; /* in */
char *varName; /* in */
long dataType; /* in */
long numElements; /* in */
long recVariance; /* in */
long dimVariances[]; /* in */
long *varNum; /* out */

CDFstatus CDFvarGet (id, varNum, recNum, indices, value)
CDFid id; /* in */
long varNum; /* in */
long recNum; /* in */
long indices[]; /* in */
void *value; /* out */

CDFstatus CDFvarHyperGet (id, varNum, recStart, recCount, recInterval,
indices, counts, intervals, buffer)
CDFid id; /* in */
long varNum; /* in */
long recStart; /* in */
long recCount; /* in */
long recInterval; /* in */
long indices[]; /* in */
long counts[]; /* in */
long intervals[]; /* in */
void *buffer; /* out */

CDFstatus CDFvarHyperPut (id, varNum, recStart, recCount, recInterval,
indices, counts, intervals, buffer)
CDFid id; /* in */
long varNum; /* in */
long recStart; /* in */
long recCount; /* in */
long recInterval; /* in */
long indices[]; /* in */
long counts[]; /* in */
long intervals[]; /* in */
void *buffer; /* in */

CDFstatus CDFvarInquire (id, varNum, varName, dataType, numElements,
recVariance, dimVariances)
CDFid id; /* in */
long varNum; /* in */
char *varName; /* out */
long *dataType; /* out */
long *numElements; /* out */
long *recVariance; /* out */
long dimVariances[CDF_MAX_DIMS]; /* out */

long CDFvarNum (id, varName)
CDFid id; /* in */
char *varName; /* in */

CDFstatus CDFvarPut (id, varNum, recNum, indices, value)
CDFid id; /* in */
long varNum; /* in */
long recNum; /* in */
long indices[]; /* in */
void *value; /* in */

CDFstatus CDFvarRename (id, varNum, varName)
CDFid id; /* in */
long varNum; /* in */
char *varName; /* in */


# B.2 Extended Standard Interface

CDFstatus CDFcloseCDF (id)
CDFid id; /* in */

CDFstatus CDFclosezVar (id, varNum)
CDFid id; /* in */
long varNum; /* in */

CDFstatus CDFconfirmAttrExistence (id, attrName)
CDFid id; /* in */
char *attrName; /* in */

CDFstatus CDFconfirmgEntryExistence (id, attrNum, entryNum)
CDFid id; /* in */
long attrNum; /* in */
long entryNum; /* in */

CDFstatus CDFconfirmrEntryExistence (id, attrNum, entryNum)
CDFid id; /* in */
long attrNum; /* in */
long entryNum; /* in */

CDFstatus CDFconfirmzEntryExistence (id, attrNum, entryNum)
CDFid id; /* in */
long attrNum; /* in */
long entryNum; /* in */

CDFstatus CDFconfirmzVarExistence (id, varNum)
CDFid id; /* in */
long varNum; /* in */

CDFstatus CDFconfirmzVarPadValueExistence (id, varNum)
CDFid id; /* in */
long varNum; /* in */

CDFstatus CDFcreateAttr (id, attrName, scope, attrNum)
CDFid id; /* in */
char *attrName; /* in */
long scope; /* in */
long *attrNum; /* out */

CDFstatus CDFcreateCDF (CDFname, dimSizes, id)
char *CDFname; /* in */
CDFid *id; /* out */

CDFstatus CDFcreatezVar (id, varName, dataType, numElements, numDims,
dimSizes, recVary, dimVarys, varNum)
CDFid id; /* in */
char *varName; /* in */
long dataType; /* in */
long numElements; /* in */
long numDims; /* in */
long dimSizes[]; /* in */
long recVary; /* in */
long dimVarys[]; /* in */
long *varNum; /* out */

CDFstatus CDFdeleteCDF (id)
CDFid id; /* in */

CDFstatus CDFdeleteAttr (id, attrNum)
CDFid id; /* in */
long attrNum; /* in */

CDFstatus CDFdeleteAttrgEntry (id, attrNum, entryNum)
CDFid id; /* in */
long attrNum; /* in */
long entryNum; /* in */

CDFstatus CDFdeleteAttrrEntry (id, attrNum, entryNum)
CDFid id; /* in */
long attrNum; /* in */
long entryNum; /* in */

CDFstatus CDFdeleteAttrzEntry (id, attrNum, entryNum)
CDFid id; /* in */
long attrNum; /* in */
long entryNum; /* in */

CDFstatus CDFdeletezVar (id, varNum)
CDFid id; /* in */
long varNum; /* in */

CDFstatus CDFdeletezVarRecords (id, varNum, startRec, endRec)
CDFid id; /* in */
long varNum; /* in */
long startRec; /* in */
long endRec; /* in */

CDFstatus CDFdeletezVarRecordsRenumber (id, varNum, startRec, endRec)
CDFid id; /* in */
long varNum; /* in */
long startRec; /* in */
long endRec; /* in */

CDFstatus CDFgetAttrgEntryDataType (id, attrNum, entryNum, dataType)
CDFid id; /* in */
long attrNum; /* in */
long entryNum; /* in */
long *dataType; /* out */

CDFstatus CDFgetAttrgEntryNumElements (id, attrNum, entryNum, numElems)
CDFid id; /* in */
long attrNum; /* in */
long entryNum; /* in */
long *numElems; /* out */


CDFstatus CDFgetAttrgEntry (id, attrNum, entryNum, value)
CDFid id; /* in */
long attrNum; /* in */
long entryNum; /* in */
void *value; /* out */

CDFstatus CDFgetAttrrEntry (id, attrNum, entryNum, value)
CDFid id; /* in */
long attrNum; /* in */
long entryNum; /* in */
void *value; /* out */

CDFstatus CDFgetAttrMaxgEntry (id, attrNum, entryNum)
CDFid id; /* in */
long attrNum; /* in */
long *entryNum; /* out */

CDFstatus CDFgetAttrMaxrEntry (id, attrNum, entryNum)
CDFid id; /* in */
long attrNum; /* in */
long *entryNum; /* out */

CDFstatus CDFgetAttrMaxzEntry (id, attrNum, entryNum)
CDFid id; /* in */
long attrNum; /* in */
long *entryNum; /* out */

CDFstatus CDFgetAttrName (id, attrNum, attrName)
CDFid id; /* in */
long attrNum; /* in */
char *attrName; /* out */

long CDFgetAttrNum (id, attrName) /* out */
CDFid id; /* in */
char *attrName; /* in */

CDFstatus CDFgetAttrrEntryDataType (id, attrNum, entryNum, dataType)
CDFid id; /* in */
long attrNum; /* in */
long entryNum; /* in */
long *dataType; /* out */

CDFstatus CDFgetAttrrEntryNumElements (id, attrNum, entryNum, numElems)
CDFid id; /* in */
long attrNum; /* in */
long entryNum; /* in */
long *numElems; /* out */

CDFstatus CDFgetAttrScope (id, attrNum, scope)
CDFid id; /* in */
long attrNum; /* in */
long *scope; /* out */

CDFstatus CDFgetAttrzEntry (id, attrNum, entryNum, value)
CDFid id; /* in */
long attrNum; /* in */
long entryNum; /* in */
void *value; /* out */

CDFstatus CDFgetAttrzEntryDataType (id, attrNum, entryNum, dataType)
CDFid id; /* in */
long attrNum; /* in */
long entryNum; /* in */
long *dataType; /* out */

CDFstatus CDFgetAttrzEntryNumElements (id, attrNum, entryNum, numElems)
CDFid id; /* in */
long attrNum; /* in */
long entryNum; /* in */
long *numElems; /* out */

CDFstatus CDFgetCacheSize (id, numBuffers)
CDFid id; /* in */
long *numBuffers; /* out */

CDFstatus CDFgetChecksum (id, checksum)
CDFid id; /* in */
long *checksum; /* out */

CDFstatus CDFgetCompression (id, compressionType, compressionParms,
compressionPercent)
CDFid id; /* in */
long *compressionType; /* out */
long compressionParms[]; /* out */
long *compressionPercent; /* out */

CDFstatus CDFgetCompressionCacheSize (id, numBuffers)
CDFid id; /* in */
long *numBuffers; /* out */

CDFstatus CDFgetCompressionInfo (cdfName, compressionType, compressionParms,
compressionSize, uncompressionSize)
char *cdfName; /* in */
long *compressionType; /* out */
long compressionParms[]; /* out */
OFF_T *compressionSize; /* out */
OFF_T *uncompressionSize; /* out */

CDFstatus CDFgetCopyright (id, Copyright)
CDFid id; /* in */
char *Copyright; /* out */

CDFstatus CDFgetDataTypeSize (dataType, numBytes)
long dataType; /* in */
long *numBytes; /* out */

CDFstatus CDFgetDecoding (id, decoding)
CDFid id; /* in */
long *decoding; /* out */

CDFstatus CDFgetEncoding (id, encoding)
CDFid id; /* in */
long *encoding; /* out */

int CDFgetFileBackward ()

CDFstatus CDFgetFormat (id, format)
CDFid id; /* in */
long *format; /* out */

CDFstatus CDFgetLibraryCopyright (Copyright)
char *Copyright; /* out */

CDFstatus CDFgetLibraryVersion (version, release, increment, subIncrement)
long *version; /* out */
long *release; /* out */
long *increment; /* out */
char *subIncrement; /* out */

CDFstatus CDFgetLeapSecondLastUpdated (id, lastUpdated)
CDFid id; /* in */
long *lastUpdated; /* out */

CDFstatus CDFgetMajority (id, majority)
CDFid id; /* in */
long *majority; /* out */

CDFstatus CDFgetMaxWrittenRecNums (id, maxRecrVars, maxReczVars)
CDFid id; /* in */
long *maxRecrVars; /* out */
long *maxReczVars; /* out */

CDFstatus CDFgetName (id, name)
CDFid id; /* in */
char *name; /* out */

CDFstatus CDFgetNegtoPosfp0Mode (id, negtoPosfp0)
CDFid id; /* in */
long *negtoPosfp0; /* out */

CDFstatus CDFgetNumAttrgEntries (id, attrNum, entries)
CDFid id; /* in */
long atrNum; /* in */
long *entries; /* out */

CDFstatus CDFgetNumAttributes (id, numAttrs)
CDFid id; /* in */
long *numAttrs; /* out */

CDFstatus CDFgetNumAttrrEntries (id, attrNum, entries)
CDFid id; /* in */
long atrNum; /* in */
long *entries; /* out */

CDFstatus CDFgetNumAttrzEntries (id, attrNum, entries)
CDFid id; /* in */
long atrNum; /* in */
long *entries; /* out */


CDFstatus CDFgetNumgAttributes (id, numAttrs)
CDFid id; /* in */
long *numAttrs; /* out */

CDFstatus CDFgetNumvAttributes (id, numAttrs)
CDFid id; /* in */
long *numAttrs; /* out */

CDFstatus CDFgetNumrVars (id, numVars)
CDFid id; /* in */
long *numrVars; /* out */

CDFstatus CDFgetNumzVars (id, numVars)
CDFid id; /* in */
long *numzVars; /* out */

CDFstatus CDFgetReadOnlyMode (id, mode)
CDFid id; /* in */
long *mode; /* out */

CDFstatus CDFgetStageCacheSize (id, numBuffers)
CDFid id; /* in */
long *numBuffers; /* out */

CDFstatus CDFgetStatusText (status, text)
CDFstatus status; /* in */
char *text; /* out */

CDFstatus CDFgetVarAllRecordsByVarName (id, varName, buffer)
CDFid id; /* in */
char *varName; /* in */
void *buffer; /* out */

long CDFgetVarNum (id, varName)
CDFid id; /* in */
char *varName; /* in */

int CDFgetValidate ()

CDFstatus CDFgetVarAllRecordsByVarName (id, varName, buffer)
CDFid id; /* in */
char *varName; /* in */
void *buffer; /* out */

CDFstatus CDFgetVarRangeRecordsByVarName (id, varName, startRec, stopRec, buffer)
CDFid id; /* in */
char *varName; /* in */
long startRec; /* in */
long stopRec; /* in */
void *buffer; /* out */

CDFstatus CDFgetVersion (id, version, release, increment)
CDFid id; /* in */
long *version; /* out */
long *release; /* out */


long *increment; /* out */

CDFstatus CDFgetzMode (id, zMode)
CDFid id; /* in */
long *zMode; /* out */

CDFstatus CDFgetzVarAllocRecords (id, varNum, allocRecs)
CDFid id; /* in */
long varNum; /* in */
long *allocRecs; /* out */

CDFstatus CDFgetzVarAllRecordsByVarID (id, varNum, buffer)
CDFid id; /* in */
long varNum; /* in */
void *buffer; /* out */

CDFstatus CDFgetzVarBlockingFactor (id, varNum, bf)
CDFid id; /* in */
long varNum; /* in */
long *bf; /* out */

CDFstatus CDFgetzVarCacheSize (id, varNum, numBuffers)
CDFid id; /* in */
long varNum; /* in */
long *numBuffers; /* out */

CDFstatus CDFgetzVarCompression (id, varNum, cType, cParms, cPercent)
CDFid id; /* in */
long varNum; /* in */
long *cType; /* out */
long cParms[]; /* out */
long *cPercent; /* out */

CDFstatus CDFgetzVarData (id, varNum, recNum, indices, value)
CDFid id; /* in */
long varNum; /* in */
long recNum; /* in */
long indices[]; /* in */
void *value; /* out */

CDFstatus CDFgetzVarDataType (id, varNum, dataType)
CDFid id; /* in */
long varNum; /* in */
long *dataType; /* out */

CDFstatus CDFgetzVarDimSizes (id, varNum, dimSizes)
CDFid id; /* in */
long varNum; /* in */
long dimSizes[]; /* out */

CDFstatus CDFgetzVarDimVariances (id, varNum, dimVarys)
CDFid id; /* in */
long varNum; /* in */
long dimVarys[]; /* out */

CDFstatus CDFgetzVarMaxAllocRecNum (id, varNum, maxRec)


CDFid id; /* in */
long varNum; /* in */
long *maxRec; /* out */

CDFstatus CDFgetzVarMaxWrittenRecNum (id, varNum, maxRec)
CDFid id; /* in */
long varNum; /* in */
long *maxRec; /* out */

CDFstatus CDFgetzVarName (id, varNum, varName)
CDFid id; /* in */
long varNum; /* in */
char *varName; /* out */

CDFstatus CDFgetzVarNumDims (id, varNum, numDims)
CDFid id; /* in */
long varNum; /* in */
long *numDims; /* out */

CDFstatus CDFgetzVarNumElements (id, varNum, numElems)
CDFid id; /* in */
long varNum; /* in */
long *numElems; /* out */

CDFstatus CDFgetzVarNumRecsWritten (id, varNum, numRecs)
CDFid id; /* in */
long varNum; /* in */
long *numRecs; /* out */

CDFstatus CDFgetzVarPadValue (id, varNum, padValue)
CDFid id; /* in */
long varNum; /* in */
void *padValue; /* out */

CDFstatus CDFgetzVarRangeRecordsByVarID (id, varNum, startRec, stopRec, buffer)
CDFid id; /* in */
long varNum; /* in */
long startRec; /* in */
long stopRec; /* in */
void *buffer; /* out */

CDFstatus CDFgetzVarRecordData (id, varNum, recNum, buffer)
CDFid id; /* in */
long varNum; /* in */
long recNum; /* in */
void *buffer; /* out */

CDFstatus CDFgetzVarRecVariance (id, varNum, recVary)
CDFid id; /* in */
long varNum; /* in */
long *recVary; /* out */

CDFstatus CDFgetzVarReservePercent (id, varNum, percent)
CDFid id; /* in */
long varNum; /* in */
long *percent; /* out */


CDFstatus CDFgetzVarSeqData (id, varNum, value)
CDFid id; /* in */
long varNum; /* in */
void *value; /* out */

CDFstatus CDFgetzVarSeqPos (id, varNum, recNum, indices)
CDFid id; /* in */
long varNum; /* in */
long *recNum; /* out */
long indices[]; /* out */

CDFstatus CDFgetzVarsMaxWrittenRecNum (id, recNum)
CDFid id; /* in */
long *recNum; /* out */

CDFstatus CDFgetzVarSparseRecords (id, varNum, sRecords)
CDFid id; /* in */
long varNum; /* in */
long *sRecords; /* out */

CDFstatus CDFgetzVarSpec (id, varNum, dataType, numElems, numDims, dimSizes, recVary, dimVarys)
CDFid id; /* in */
long varNum; /* in */
long *dataType; /* out */
long *numElems; /* out */
long *numDims; /* out */
long dimSizes[]; /* out */
long *recVary; /* out */
long dimVarys[]; /* out */

CDFstatus CDFgetzVarsRecordDatabyNumbers (id, numVars, varNums,
varRecNum, buffer)
CDFid id; /* in */
long numVars; /* in */
long varNums[]; /* in */
long varRecNum; /* in */
void *buffer; /* out */

CDFstatus CDFhyperGetzVarData (id, varNum, recNum, reCount, recInterval,
indices, counts, intervals, buffer)
CDFid id; /* in */
long varNum; /* in */
long recNum; /* in */
long recCount; /* in */
long recInterval; /* in */
long indices[]; /* in */
long counts[]; /* in */
long intervals[]; /* in */
void *buffer; /* out */

CDFstatus CDFhyperPutzVarData (id, varNum, recNum, reCount, recInterval,
indices, counts, intervals, buffer)
CDFid id; /* in */
long varNum; /* in */
long recNum; /* in */


long recCount; /* in */
long recInterval; /* in */
long indices[]; /* in */
long counts[]; /* in */
long intervals[]; /* in */
void *buffer; /* in */

CDFstatus CDFinquireAttr (id, attrNum, attrName, attrScope, maxgEntry, maxrEntry,
maxzEntry)
CDFid id; /* in */
long attrNum; /* in */
char *attrName; /* out */
long *attrScope; /* out */
long *maxgEntry; /* out */
long *maxrEntry; /* out */
long *maxzEntry; /* out */

CDFstatus CDFinquireAttrgEntry (id, attrNum, entryNum, dataType, numElems)
CDFid id; /* in */
long attrNum; /* in */
long entryNum; /* in */
long *dataType; /* out */
long *numElems; /* out */

CDFstatus CDFinquireAttrrEntry (id, attrNum, entryNum, dataType, numElems)
CDFid id; /* in */
long attrNum; /* in */
long entryNum; /* in */
long *dataType; /* out */
long *numElems; /* out */

CDFstatus CDFinquireAttrzEntry (id, attrNum, entryNum, dataType, numElems)
CDFid id; /* in */
long attrNum; /* in */
long entryNum; /* in */
long *dataType; /* out */
long *numElems; /* out */

CDFstatus CDFinquireCDF (id, numDims, dimSizes, encoding, majority, maxrRec,
numrVars, maxzRec, numzVars, numAttrs)
CDFid id; /* in */
long *numDims; /* out */
long dimSizes[CDF_MAX_DIMS]; /* out */
long *encoding; /* out */
long *majority; /* out */
long *maxrRec; /* out */
long *numrVars; /* out */
long *maxzRec; /* out */
long *numzVars; /* out */
long *numAttrs; /* out */

CDFstatus CDFinquirezVar (id, varNum, varName, dataType, numElems,
numDims, dimSizes, recVary, dimVarys)
CDFid id; /* in */
long varNum; /* in */
char *varName; /* out */


long *dataType; /* out */
long *numElems; /* out */
long *numDims; /* out */
long dimSizes[]; /* out */
long *recVary; /* out */
long dimVarys[]; /* out */

CDFstatus CDFinsertVarAllRecordsByVarName (id, varName, startRec, numRecs, buffer)
CDFid id; /* in */
char *varName; /* in */
long startRec; /* in */
long numRecs; /* in */
void *buffer; /* in */

CDFstatus CDFinsertrVarAllRecordsByVarID (id, varNum, startRec, numRecs, buffer)
CDFid id; /* in */
long varNum; /* in */
long startRec; /* in */
long numRecs; /* in */
void *buffer; /* in */

CDFstatus CDFinsertzVarAllRecordsByVarID (id, varNum, startRec, numRecs, buffer)
CDFid id; /* in */
long varNum; /* in */
long startRec; /* in */
long numRecs; /* in */
void *buffer; /* in */

CDFstatus CDFputAttrgEntry (id, attrNum, entryNum, dataType, numElems, value)
CDFid id; /* in */
long attrNum; /* in */
long entryNum; /* in */
long dataType; /* in */
long numElems; /* in */
void *value; /* in */

CDFstatus CDFopenCDF (CDFname, id)
char *CDFname; /* in */
CDFid *id; /* out */

CDFstatus CDFputAttrrEntry (id, attrNum, entryNum, dataType, numElems, value)
CDFid id; /* in */
long attrNum; /* in */
long entryNum; /* in */
long dataType; /* in */
long numElems; /* in */
void *value; /* in */

CDFstatus CDFputAttrzEntry (id, attrNum, entryNum, dataType, numElems, value)
CDFid id; /* in */
long attrNum; /* in */
long entryNum; /* in */
long dataType; /* in */
long numElems; /* in */
void *value; /* in */


CDFstatus CDFputVarAllRecordsByVarName (id, varName, buffer)
CDFid id; /* in */
char *varName; /* in */
void *buffer; /* in */

CDFstatus CDFputVarRangeRecordsByVarName (id, varName, startRec, stopRec, buffer)
CDFid id; /* in */
char *varName; /* in */
long startRec; /* in */
long stopRec; /* in */
void *buffer; /* in */

CDFstatus CDFputzVarAllRecordsByVarID (id, varNum, buffer)
CDFid id; /* in */
long varNum; /* in */
void *buffer; /* in */

CDFstatus CDFputzVarData (id, varNum, recNum, indices, value)
CDFid id; /* in */
long varNum; /* in */
long recNUm; /* in */
long indices[]; /* in */
void *value; /* in */

CDFstatus CDFputzVarRangeRecordsByVarID (id, varNum, startRec, stopRec, buffer)
CDFid id; /* in */
long varNum; /* in */
long startRec; /* in */
long stopRec; /* in */
void *buffer; /* in */

CDFstatus CDFputzVarRecordData (id, varNum, recNum, values)
CDFid id; /* in */
long varNum; /* in */
long recNUm; /* in */
void *values; /* in */

CDFstatus CDFputzVarSeqData (id, varNum, value)
CDFid id; /* in */
long varNum; /* in */
void *value; /* in */

CDFstatus CDFputzVarsRecordDatabyNumbers (id, numVars, varNums,
varRecNum, buffer)
CDFid id; /* in */
long numVars; /* in */
long varNums[]; /* in */
long varRecNum; /* in */
void *buffer; /* in */

CDFstatus CDFrenameAttr (id, attrNum, attrName)
CDFid id; /* in */
long attrNum; /* in */
char *attrName; /* in */

CDFstatus CDFrenamezVar (id, varNum, varName)


CDFid id; /* in */
long varNum; /* in */
char *varName; /* in */

CDFstatus CDFsetAttrgEntryDataSpec (id, attrNum, entryNum, dataType)
CDFid id; /* in */
long attrNum; /* in */
long entryNum; /* in */
long dataType; /* in */

CDFstatus CDFsetAttrrEntryDataSpec (id, attrNum, entryNum, dataType)
CDFid id; /* in */
long attrNum; /* in */
long entryNum; /* in */
long dataType; /* in */

CDFstatus CDFsetAttrScope (id, attrNum, scope)
CDFid id; /* in */
long attrNum; /* in */
long scope; /* in */

CDFstatus CDFsetAttrzEntryDataSpec (id, attrNum, entryNum, dataType)
CDFid id; /* in */
long attrNum; /* in */
long entryNum; /* in */
long dataType; /* in */

CDFstatus CDFsetCacheSize (id, numBuffers)
CDFid id; /* in */
long numBuffers; /* in */

CDFstatus CDFsetChecksum (id, checksum)
CDFid id; /* in */
long checksum; /* in */

CDFstatus CDFsetCompression (id, compressionType, compressionParms)
CDFid id; /* in */
long compressionType; /* in */
long compressionParms[]; /* in */

CDFstatus CDFsetCompressionCacheSize (id, numBuffers)
CDFid id; /* in */
long numBuffers; /* in */

CDFstatus CDFsetDecoding (id, decoding)
CDFid id; /* in */
long decoding; /* in */

CDFstatus CDFsetEncoding (id, encoding)
CDFid id; /* in */
long encoding; /* in */

void CDFsetFileBackward (mode)
long mode; /* in */

CDFstatus CDFsetFormat (id, format)


CDFid id; /* in */
long format; /* in */

CDFstatus CDFsetLeapSecondLastUpdated (id, lastUpdated)
CDFid id; /* in */
long lastUpdated; /* in */

CDFstatus CDFsetMajority (id, majority)
CDFid id; /* in */
long majority; /* in */

CDFstatus CDFsetNegtoPosfp0Mode (id, negtoPosfp0)
CDFid id; /* in */
long negtoPosfp0; /* in */

CDFstatus CDFsetReadOnlyMode (id, readOnly)
CDFid id; /* in */
long readOnly; /* in */

CDFstatus CDFsetStageCacheSize (id, numBuffers)
CDFid id; /* in */
long numBuffers; /* in */

void CDFsetValidate (mode)
long mode; /* in */

CDFstatus CDFsetzMode (id, zMode)
CDFid id; /* in */
long zMode; /* in */

CDFstatus CDFsetzVarAllocBlockRecords (id, varNum, firstRec, lastRec)
CDFid id; /* in */
long varNum; /* in */
long firstRec; /* in */
long lastRec; /* in */

CDFstatus CDFsetzVarAllocRecords (id, varNum, numRecs)
CDFid id; /* in */
long varNum; /* in */
long numRecs; /* in */

CDFstatus CDFsetzVarBlockingFactor (id, varNum, bf)
CDFid id; /* in */
long varNum; /* in */
long bf; /* in */

CDFstatus CDFsetzVarCacheSize (id, varNum, numBuffers)
CDFid id; /* in */
long varNum; /* in */
long numBuffers; /* in */

CDFstatus CDFsetzVarCompression (id, varNum, compressionType,
compressionParms)
CDFid id; /* in */
long varNum; /* in */
long compressionType; /* in */


long compressionParms[]; /* in */

CDFstatus CDFsetzVarDataSpec (id, varNum, dataType)
CDFid id; /* in */
long varNum; /* in */
long dataType; /* in */

CDFstatus CDFsetzVarDimVariances (id, varNum, dimVarys)
CDFid id; /* in */
long varNum; /* in */
long dimVarys[]; /* in */

CDFstatus CDFsetzVarInitialRecs (id, varNum, initialRecs)
CDFid id; /* in */
long varNum; /* in */
long initialRecs; /* in */

CDFstatus CDFsetzVarPadValue (id, varNum, padValue)
CDFid id; /* in */
long varNum; /* in */
void *padValue; /* in */

CDFstatus CDFsetzVarRecVariance (id, varNum, recVary)
CDFid id; /* in */
long varNum; /* in */
long recVary; /* in */

CDFstatus CDFsetzVarReservePercent (id, varNum, reservePercent)
CDFid id; /* in */
long varNum; /* in */
long reservePercent; /* in */

CDFstatus CDFsetzVarsCacheSize (id, numBuffers)
CDFid id; /* in */
long numBuffers; /* in */

CDFstatus CDFsetzVarSeqPos (id, varNum, recNum, indices)
CDFid id; /* in */
long varNum; /* in */
long recNum; /* in */
long indices[]; /* in */

CDFstatus CDFsetzVarSparseRecords (id, varNum, sRecords)
CDFid id; /* in */
long varNum; /* in */
long sRecords; /* in */


# B.3 CDFread Functions

CDFstatus CDFreadgAttrEntry (id, attrNum, entry, dataType, numElems, data)
CDFid id; /* in */
long attrNum; /* in */
long entryNum; /* in */
long *dataType; /* out */
long *numElems; /* out */
CDFdata *data; /* out */

CDFstatus CDFreadzAttrEntry (id, attrNum, entry, dataType, numElems, data)
CDFid id; /* in */
long attrNum; /* in */
long entryNum; /* in */
long *dataType; /* out */
long *numElems; /* out */
CDFdata *data; /* out */

CDFstatus CDFreadzVarPadValue (id, varNum, dataType, numElems, data)
CDFid id; /* in */
long varNum; /* in */
long *dataType; /* out */
long *numElems; /* out */
CDFdata *data; /* out */

CDFstatus CDFreadzVarAllByVarID (id, varNum, numRecs, dataType, numElems, numDims, dimSizes, recVary,
dimVarys, data)
CDFid id; /* in */
long varNum; /* in */
long *numRecs; /* out */
long *dataType; /* out */
long *numElems; /* out */
long *numDims; /* out */
long dimSizes[]; /* out */
long *recVary; /* out */
long dimVarys[]; /* out */
CDFdata *data; /* out */

CDFstatus CDFreadzVarDataByVarID (id, varNum, numRecs, data)
CDFid id; /* in */
long varNum; /* in */
long *numRecs; /* out */
CDFdata *data; /* out */

CDFstatus CDFreadzVarRangeDataByVarID (id, varNum, startRec, stopRec, data)
CDFid id; /* in */
long varNum; /* in */
long startRec; /* in */
long stopRec; /* in */
CDFdata *data; /* out */

CDFstatus CDFreadzVarAllByVarName (id, varName, numRecs, dataType, numElems, numDims, dimSizes, recVary,


dimVarys, data)
CDFid id; /* in */
char *varName; /* in */
long *numRecs; /* out */
long *dataType; /* out */
long *numElems; /* out */
long *numDims; /* out */
long dimSizes[]; /* out */
long *recVary; /* out */
long dimVarys[]; /* out */
CDFdata *data; /* out */

CDFstatus CDFreadzVarDataByVarName (id, varName, numRecs, data)
CDFid id; /* in */
char *varName; /* in */
long *numRecs; /* out */
CDFdata *data; /* out */

CDFstatus CDFreadzVarRangeDataByVarName (id, varName, startRec, stopRec, data)
CDFid id; /* in */
char *varName; /* in */
long startRec; /* in */
long stopRec; /* in */
CDFdata *data; /* out */

CDF_Free_String (numStrings, strings)
long numStrings; /* in */
char **strings; /* in */


# B.4 Internal Interface

CDFstatus CDFlib (op, ...)
long op; /* in */
CLOSE_
CDF_
rVAR_
zVAR_

CONFIRM_
ATTR_ long *attrNum /* out */
ATTR_EXISTENCE_ char *attrName /* in */
CDF_ CDFid *id /* out */
CDF_ACCESS_
CDF_CACHESIZE_ long *numBuffers /* out */
CDF_DECODING_ long *decoding /* out */
CDF_NAME_ char CDFname[CDF_PATHNAME_LEN+1]
/* out */
CDF_NEGtoPOSfp0_MODE_ long *mode /* out */
CDF_READONLY_MODE_ long *mode /* out */
CDF_STATUS_ CDFstatus *status /* out */
CDF_zMODE_ long *mode /* out */
COMPRESS_CACHESIZE_ long *numBuffers /* out */
CURgENTRY_EXISTENCE_
CURrENTRY_EXISTENCE_
CURzENTRY_EXISTENCE_
gENTRY_ long *entryNum /* out */
gENTRY_EXISTENCE_ long entryNum /* in */
rENTRY_ long *entryNum /* out */
rENTRY_EXISTENCE_ long entryNum /* in */
rVAR_ long *varNum /* out */
rVAR_CACHESIZE_ long *numBuffers /* out */
rVAR_EXISTENCE_ char *varName /* in */
rVAR_PADVALUE_
rVAR_RESERVEPERCENT_ long *percent /* out */
rVAR_SEQPOS_ long *recNum /* out */
long indices[CDF_MAX_DIMS] /* out */
rVARs_DIMCOUNTS_ long counts[CDF_MAX_DIMS] /* out */
rVARs_DIMINDICES_ long indices[CDF_MAX_DIMS] /* out */
rVARs_DIMINTERVALS_ long intervals[CDF_MAX_DIMS] /* out */
rVARs_RECCOUNT_ long *recCount /* out */
rVARs_RECINTERVAL_ long *recInterval /* out */
rVARs_RECNUMBER_ long *recNum /* out */
STAGE_CACHESIZE_ long *numBuffers /* out */
zENTRY_ long *entryNum /* out */
zENTRY_EXISTENCE_ long entryNum /* in */
zVAR_ long *varNum /* out */
zVAR_CACHESIZE_ long *numBuffers /* out */
zVAR_DIMCOUNTS_ long counts[CDF_MAX_DIMS] /* out */
zVAR_DIMINDICES_ long indices[CDF_MAX_DIMS] /* out */
zVAR_DIMINTERVALS_ long intervals[CDF_MAX_DIMS] /* out */
zVAR_EXISTENCE_ char *varName /* in */
zVAR_PADVALUE_



zVAR_RECCOUNT_ long *recCount /* out */
zVAR_RECINTERVAL_ long *recInterval /* out */
zVAR_RECNUMBER_ long *recNum /* out */
zVAR_RESERVEPERCENT_ long *percent /* out */
zVAR_SEQPOS_ long *recNum /* out */
long indices[CDF_MAX_DIMS] /* out */

CREATE_
ATTR_ char *attrName /* in */
long scope /* in */
long *attrNum /* out */


CDF_ char *CDFname /* in */
long numDims /* in */
long dimSizes[] /* in */
CDFid *id /* out */


rVAR_ char *varName /* in */
long dataType /* in */
long numElements /* in */
long recVary /* in */
long dimVarys[] /* in */
long *varNum /* out */


zVAR_ char *varName /* in */
long dataType /* in */
long numElements /* in */
long numDims /* in */
long dimSizes[] /* in */
long recVary /* in */
long dimVarys[] /* in */
long *varNum /* out */

DELETE_
ATTR_
CDF_
gENTRY_
rENTRY_
rVAR_
rVAR_RECORDS_ long firstRecord /* in */
long lastRecord /* in */
rVAR_RECORDS_RENUMBER_ long firstRecord /* in */
long lastRecord /* in */
zENTRY_
zVAR_
zVAR_RECORDS_ long firstRecord /* in */
long lastRecord /* in */


zVAR_RECORDS_RENUMBER_ long firstRecord /* in */
long lastRecord /* in */

GET_
ATTR_MAXgENTRY_ long *maxEntry /* out */
ATTR_MAXrENTRY_ long *maxEntry /* out */
ATTR_MAXzENTRY_ long *maxEntry /* out */
ATTR_NAME_ char attrName[CDF_ATTR_NAME_LEN256+1]


/* out */
ATTR_NUMBER_ char *attrName /* in */
long *attrNum /* out */
ATTR_NUMgENTRIES_ long *numEntries /* out */
ATTR_NUMrENTRIES_ long *numEntries /* out */
ATTR_NUMzENTRIES_ long *numEntries /* out */
ATTR_SCOPE_ long *scope /* out */
CDF_CHECKSUM_ long *checksum /* out */
CDF_COMPRESSION_ long *cType /* out */
long cParms[CDF_MAX_PARMS] /* out */
long *cPct /* out */
CDF_COPYRIGHT_ char Copyright[CDF_COPYRIGHT_LEN+1]
/* out */
CDF_ENCODING_ long *encoding /* out */
CDF_FORMAT_ long *format /* out */
CDF_INCREMENT_ long *increment /* out */
CDF_INFO_ char *name /* in */
long *cType /* out */
long cParms[CDF_MAX_PARMS] /* out */
OFF_T *cSize /* out */
OFF_T *uSize /* out */
CDF_LEAPSECONDLASTUPDATED_ long *lastUpdated /* out */
CDF_MAJORITY_ long *majority /* out */
CDF_NUMATTRS_ long *numAttrs /* out */
CDF_NUMgATTRS_ long *numAttrs /* out */
CDF_NUMrVARS_ long *numVars /* out */
CDF_NUMvATTRS_ long *numAttrs /* out */
CDF_NUMzVARS_ long *numVars /* out */
CDF_RELEASE_ long *release /* out */
CDF_VERSION_ long *version /* out */
DATATYPE_SIZE_ long dataType /* in */
long *numBytes /* out */
gENTRY_DATA_ void *value /* out */
gENTRY_DATATYPE_ long *dataType /* out */
gENTRY_NUMELEMS_ long *numElements /* out */
LIB_COPYRIGHT_ char Copyright[CDF_COPYRIGHT_LEN+1]
/* out */
LIB_INCREMENT_ long *increment /* out */
LIB_RELEASE_ long *release /* out */
LIB_subINCREMENT_ char *subincrement /* out */
LIB_VERSION_ long *version /* out */
rENTRY_DATA_ void *value /* out */
rENTRY_DATATYPE_ long *dataType /* out */
rENTRY_NUMELEMS_ long *numElements /* out */
rENTRY_NUMSTRINGS_ long *numStrings /* out */
rENTRY_STRINGSDATA_ long *numStrings /* out */
char **strings /* out */
rVAR_ALLOCATEDFROM_ long startRecord /* in */
long *nextRecord /* out */
rVAR_ALLOCATEDTO_ long startRecord /* in */
long *lastRecord /* out */
rVAR_BLOCKINGFACTOR_ long *blockingFactor /* out */
rVAR_COMPRESSION_ long *cType /* out */
long cParms[CDF_MAX_PARMS] /* out */
long *cPct /* out */
rVAR_DATA_ void *value /* out */


rVAR_DATATYPE_ long *dataType /* out */
rVAR_DIMVARYS_ long dimVarys[CDF_MAX_DIMS] /* out */
rVAR_HYPERDATA_ void *buffer /* out */
rVAR_MAXallocREC_ long *maxRec /* out */
rVAR_MAXREC_ long *maxRec /* out */
rVAR_NAME_ char varName[CDF_VAR_NAME_LEN256+1] /* out */
rVAR_nINDEXENTRIES_ long *numEntries /* out */
rVAR_nINDEXLEVELS_ long *numLevels /* out */
rVAR_nINDEXRECORDS_ long *numRecords /* out */
rVAR_NUMallocRECS_ long *numRecords /* out */
rVAR_NUMBER_ char *varName /* in */
long *varNum /* out */
rVAR_NUMELEMS_ long *numElements /* out */
rVAR_NUMRECS_ long *numRecords /* out */
rVAR_PADVALUE_ void *value /* out */
rVAR_RECVARY_ long *recVary /* out */
rVAR_SEQDATA_ void *value /* out */
rVAR_SPARSEARRAYS_ long *sArraysType /* out */
long sArraysParms[CDF_MAX_PARMS] /* out */
long *sArraysPct /* out */
rVAR_SPARSERECORDS_ long *sRecordsType /* out */
rVARs_DIMSIZES_ long dimSizes[CDF_MAX_DIMS] /* out */
rVARs_MAXREC_ long *maxRec /* out */
rVARs_NUMDIMS_ long *numDims /* out */
rVARs_RECDATA_ long numVars /* in */
long varNums[] /* in */
void *buffer /* out */
STATUS_TEXT_ char text[CDF_STATUSTEXT_LEN+1] /* out */
zENTRY_DATA_ void *value /* out */
zENTRY_DATATYPE_ long *dataType /* out */
zENTRY_NUMELEMS_ long *numElements /* out */
zENTRY_NUMSTRINGS_ long *numStrings /* out */
zENTRY_STRINGSDATA_ long *numStrings /* out */
char **strings /* out */
zVAR_ALLOCATEDFROM_ long startRecord /* in */
long *nextRecord /* out */
zVAR_ALLOCATEDTO_ long startRecord /* in */
long *lastRecord /* out */
zVAR_BLOCKINGFACTOR_ long *blockingFactor /* out */
zVAR_COMPRESSION_ long *cType /* out */
long cParms[CDF_MAX_PARMS] /* out */
long *cPct /* out */
zVAR_DATA_ void *value /* out */
zVAR_DATATYPE_ long *dataType /* out */
zVAR_DIMSIZES_ long dimSizes[CDF_MAX_DIMS] /* out */
zVAR_DIMVARYS_ long dimVarys[CDF_MAX_DIMS] /* out */
zVAR_HYPERDATA_ void *buffer /* out */
zVAR_MAXallocREC_ long *maxRec /* out */
zVAR_MAXREC_ long *maxRec /* out */
zVAR_NAME_ char varName[CDF_VAR_NAME_LEN256+1] /* out */
zVAR_nINDEXENTRIES_ long *numEntries /* out */
zVAR_nINDEXLEVELS_ long *numLevels /* out */
zVAR_nINDEXRECORDS_ long *numRecords /* out */
zVAR_NUMallocRECS_ long *numRecords /* out */
zVAR_NUMBER_ char *varName /* in */
long *varNum /* out */


zVAR_NUMDIMS_ long *numDims /* out */
zVAR_NUMELEMS_ long *numElements /* out */
zVAR_NUMRECS_ long *numRecords /* out */
zVAR_PADVALUE_ void *value /* out */
zVAR_RECVARY_ long *recVary /* out */
zVAR_SEQDATA_ void *value /* out */
zVAR_SPARSEARRAYS_ long *sArraysType /* out */
long sArraysParms[CDF_MAX_PARMS] /* out */
long *sArraysPct /* out */
zVAR_SPARSERECORDS_ long *sRecordsType /* out */
zVARs_MAXREC_ long *maxRec /* out */
zVARs_RECDATA_ long numVars /* in */
long varNums[] /* in */
void *buffer /* out */
NULL_

OPEN_
CDF_ char *CDFname /* in */
CDFid *id /* out */
PUT__
ATTR_NAME_ char *attrName /* in */
ATTR_SCOPE_ long scope /* in */
CDF_CHECKSUM_ long checksum /* in */
CDF_COMPRESSION_ long cType /* in */
long cParms[] /* in */
CDF_ENCODING_ long encoding /* in */
CDF_FORMAT_ long format /* in */
CDF_LEAPSECONDLASTUPDATED_ long lastUpdated /* in */
CDF_MAJORITY_ long majority /* in */
gENTRY_DATA_ long dataType /* in */
long numElements /* in */
void *value /* in */
gENTRY_DATASPEC_ long dataType /* in */
long numElements /* in */
rENTRY_DATA_ long dataType /* in */
long numElements /* in */
void *value /* in */
rENTRY_DATASPEC_ long dataType /* in */
long numElements /* in */
rVAR_ALLOCATEBLOCK_ long firstRecord /* in */
long lastRecord /* in */
rVAR_ALLOCATERECS_ long numRecords /* in */
rVAR_BLOCKINGFACTOR_ long blockingFactor /* in */
rVAR_COMPRESSION_ long cType /* in */
long cParms[] /* in */
rVAR_DATA_ void *value /* in */
rVAR_DATASPEC_ long dataType /* in */
long numElements /* in */
rVAR_DIMVARYS_ long dimVarys[] /* in */
rVAR_HYPERDATA_ void *buffer /* in */
rVAR_INITIALRECS_ long nRecords /* in */
rVAR_NAME_ char *varName /* in */
rVAR_PADVALUE_ void *value /* in */
rVAR_RECVARY_ long recVary /* in */
rVAR_SEQDATA_ void *value /* in */
rVAR_SPARSEARRAYS_ long sArraysType /* in */


long sArraysParms[] /* in */
rVAR_SPARSERECORDS_ long sRecordsType /* in */
rVARs_RECDATA_ long numVars /* in */
long varNums[] /* in */
void *buffer /* in */
zENTRY_DATA_ long dataType /* in */
long numElements /* in */
void *value /* in */
zENTRY_DATASPEC_ long dataType /* in */
long numElements /* in */
zVAR_ALLOCATEBLOCK_ long firstRecord /* in */
long lastRecord /* in */
zVAR_ALLOCATERECS_ long numRecords /* in */
zVAR_BLOCKINGFACTOR_ long blockingFactor /* in */
zVAR_COMPRESSION_ long cType /* in */
long cParms[] /* in */
zVAR_DATA_ void *value /* in */
zVAR_DATASPEC_ long dataType /* in */
long numElements /* in */
zVAR_DIMVARYS_ long dimVarys[] /* in */
zVAR_INITIALRECS_ long nRecords /* in */
zVAR_HYPERDATA_ void *buffer /* in */
zVAR_NAME_ char *varName /* in */
zVAR_PADVALUE_ void *value /* in */
zVAR_RECVARY_ long recVary /* in */
zVAR_SEQDATA_ void *value /* in */
zVAR_SPARSEARRAYS_ long sArraysType /* in */
long sArraysParms[] /* in */
zVAR_SPARSERECORDS_ long sRecordsType /* in */
zVARs_RECDATA_ long numVars /* in */
long varNums[] /* in */
void *buffer /* in */
SELECT_
ATTR_ long attrNum /* in */
ATTR_NAME_ char *attrName /* in */
CDF_ CDFid id /* in */
CDF_CACHESIZE_ long numBuffers /* in */
CDF_DECODING_ long decoding /* in */
CDF_NEGtoPOSfp0_MODE_ long mode /* in */
CDF_READONLY_MODE_ long mode /* in */
CDF_SCRATCHDIR_ char *dirPath /* in */
CDF_STATUS_ CDFstatus status /* in */
CDF_zMODE_ long mode /* in */
COMPRESS_CACHESIZE_ long numBuffers /* in */
gENTRY_ long entryNum /* in */
rENTRY_ long entryNum /* in */
rENTRY_NAME_ char *varName /* in */
rVAR_ long varNum /* in */
rVAR_CACHESIZE_ long numBuffers /* in */
rVAR_NAME_ char *varName /* in */
rVAR_RESERVEPERCENT_ long percent /* in */
rVAR_SEQPOS_ long recNum /* in */
long indices[] /* in */
rVARs_CACHESIZE_ long numBuffers /* in */
rVARs_DIMCOUNTS_ long counts[] /* in */
rVARs_DIMINDICES_ long indices[] /* in */


rVARs_DIMINTERVALS_ long intervals[] /* in */
rVARs_RECCOUNT_ long recCount /* in */
rVARs_RECINTERVAL_ long recInterval /* in */
rVARs_RECNUMBER_ long recNum /* in */
STAGE_CACHESIZE_ long numBuffers /* in */
zENTRY_ long entryNum /* in */
zENTRY_NAME_ char *varName /* in */
zVAR_ long varNum /* in */
zVAR_CACHESIZE_ long numBuffers /* in */
zVAR_DIMCOUNTS_ long counts[] /* in */
zVAR_DIMINDICES_ long indices[] /* in */
zVAR_DIMINTERVALS_ long intervals[] /* in */
zVAR_NAME_ char *varName /* in */
zVAR_RECCOUNT_ long recCount /* in */
zVAR_RECINTERVAL_ long recInterval /* in */
zVAR_RECNUMBER_ long recNum /* in */
zVAR_RESERVEPERCENT_ long percent /* in */
zVAR_SEQPOS_ long recNum /* in */
long indices[] /* in */
zVARs_CACHESIZE_ long numBuffers /* in */
zVARs_RECNUMBER_ long recNum /* in */


# B.5 EPOCH Utility Routines

double computeEPOCH (year, month, day, hour, minute, second, msec)
long year; /* in */
long month; /* in */
long day; /* in */
long hour; /* in */
long minute; /* in */
long second; /* in */
long msec; /* in */

void EPOCHbreakdown (epoch, year, month, day, hour, minute, second, msec)
double epoch; /* in */
long *year; /* out */
long *month; /* out */
long *day; /* out */
long *hour; /* out */
long *minute; /* out */
long *second; /* out */
long *msec; /* out */

void toEncodeEPOCH (epoch, style, epString)
double epoch; /* in */
int style; /* in */
char epString[EPOCH_STRING_LEN+1]; /* out */

void encodeEPOCH (epoch, epString)
double epoch; /* in */
char epString[EPOCH_STRING_LEN+1]; /* out */

void encodeEPOCH1 (epoch, epString)
double epoch; /* in */
char epString[EPOCH1_STRING_LEN+1]; /* out */

void encodeEPOCH2 (epoch, epString)
double epoch; /* in */
char epString[EPOCH2_STRING_LEN+1]; /* out */

void encodeEPOCH3 (epoch, epString)
double epoch; /* in */
char epString[EPOCH3_STRING_LEN+1]; /* out */

void encodeEPOCH4 (epoch, epString)
double epoch; /* in */
char epString[EPOCH4_STRING_LEN+1]; /* out */

void encodeEPOCHx (epoch, format, epString)
double epoch; /* in */
char format[EPOCHx_FORMAT_MAX+1]; /* in */
char epString[EPOCHx_STRING_MAX+1]; /* out */

double parseEPOCH (epString)
char epString[EPOCH_STRING_LEN+1]; /* in */


double toParseEPOCH (epString)
char epString[EPOCH_STRING_LEN+1]; /* in */

double parseEPOCH1 (epString)
char epString[EPOCH1_STRING_LEN+1]; /* in */

double parseEPOCH2 (epString)
char epString[EPOCH2_STRING_LEN+1]; /* in */

double parseEPOCH3 (epString)
char epString[EPOCH3_STRING_LEN+1]; /* in */
double parseEPOCH4 (epString)
char epString[EPOCH4_STRING_LEN+1]; /* in */

double computeEPOCH16 (year, month, day, hour, minute, second, msec, microsec, nanosec, picosec)
long year; /* in */
long month; /* in */
long day; /* in */
long hour; /* in */
long minute; /* in */
long second; /* in */
long msec; /* in */
long microsec; /* in */
long nanosec; /* in */
long picosec; /* in */
double epoch[2]; /* out */

void EPOCH16breakdown (epoch, year, month, day, hour, minute, second, msec, microsec, nanosec, picosec)
double epoch[2]; /* in */
long *year; /* out */
long *month; /* out */
long *day; /* out */
long *hour; /* out */
long *minute; /* out */
long *second; /* out */
long *msec; /* out */
long *microsec; /* out */
long *nanosec; /* out */
long *picosec; /* out */

void toEncodeEPOCH16 (epoch, style, epString)
double epoch[2]; /* in */
int style; /* in */
char epString[EPOCH16_STRING_LEN +1]; /* out */

void encodeEPOCH16 (epoch, epString)
double epoch[2]; /* in */
char epString[EPOCH16_STRING_LEN +1]; /* out */

void encodeEPOCH16_1 (epoch, epString)
double epoch[2]; /* in */
char epString[EPOCH16_1_STRING_LEN+1]; /* out */

void encodeEPOCH16_2 (epoch, epString)
double epoch[2]; /* in */


char epString[EPOCH16_2_STRING_LEN+1]; /* out */

void encodeEPOCH16_3 (epoch, epString)
double epoch[2]; /* in */
char epString[EPOCH16_3_STRING_LEN+1]; /* out */

void encodeEPOCH16_4 (epoch, epString)
double epoch[2]; /* in */
char epString[EPOCH16_4_STRING_LEN+1]; /* out */

void encodeEPOCH16_x (epoch, format, epString)
double epoch[2]; /* in */
char format[EPOCHx_FORMAT_MAX+1]; /* in */
char epString[EPOCHx_STRING_MAX+1]; /* out */

double toParseEPOCH16 (epString, epoch)
char epString[EPOCH16__STRING_LEN+1]; /* in */
double epoch[2]; /* out */

double parseEPOCH16 (epString, epoch)
char epString[EPOCH16__STRING_LEN+1]; /* in */
double epoch[2]; /* out */

double parseEPOCH16_1 (epString)
char epString[EPOCH16_1_STRING_LEN+1]; /* in */
double epoch[2]; /* out */

double parseEPOCH16_2 (epString)
char epString[EPOCH16_2_STRING_LEN+1]; /* in */
double epoch[2]; /* out */

double parseEPOCH16_3 (epString)
char epString[EPOCH16_3_STRING_LEN+1]; /* in */
double epoch[2]; /* out */

double parseEPOCH16_4 (epString)
char epString[EPOCH16_4_STRING_LEN+1]; /* in */
double epoch[2]; /* out */

void EPOCHtoUnixTime (epoch, unixTime, numTimes)
double *epoch; /* in */
double *unixTime; /* out */
int numTimes; /* in */

void EPOCH16toUnixTime (epoch, unixTime, numTimes)
double *epoch; /* in */
double *unixTime; /* out */
int numTimes; /* in */

void UnixTimetoEPOCH (unixTime, epoch, numTimes)
double *unixTime; /* in */
double *epoch; /* out */
int numTimes; /* in */

void UnixTimetoEPOCH16 (unixTime, epoch, numTimes)
double *unixTime; /* in */


double *epoch; /* out */
int numTimes; /* in */


# B.6 TT2000 Utility Routines

computeTT2000 or CDF_TT2000_from_UTC_parts
long long computeTT2000 (year, month, day, ...) (*Variable argument form)
double year; /* in */
double month; /* in */
double day; /* in */
...
TT2000END; /* in */

long long computeTT2000 (year, month, day, hour, minute, second, msec, usec, nsec) (*Full form)
double year; /* in */
double month; /* in */
double day; /* in */
double hour; /* in */
double minute; /* in */
double second; /* in */
double msec; /* in */
double usec; /* in */
double nsec; /* in */

breakdownTT2000 or CDF_TT2000_to_UTC_parts or TT2000breakdown
void breakdownTT2000 (tt2000, year, month, day, ...)^67
long long tt2000; /* in */
double *year; /* out */
double *month; /* out */
double *day; /* out */
...
TT2000NULL; /* in */

void breakdownTT2000 (tt2000, year, month, day, hour, minute, second, msec, usec, nsec)^68
long long tt2000; /* in */
double *year; /* out */
double *month; /* out */
double *day; /* out */
double *hour; /* out */
double *minute; /* out */
double *second; /* out */
double *msec; /* out */
double *usec; /* out */
double *nsec; /* out */

void toEncodeTT2000 (tt2000, style, epString)
long long tt2000; /* in */
int style; /* in */
char *epString; /* out */

encodeTT2000 or CDF_TT2000_to_UTC_string
void encodeTT2000 (tt2000, epString) (*Variable argument form)
long long tt2000; /* in */

(^67) Variable argument list form after the day field. But, need to have TT2000NULL to indicate the end of the list.
(^68) Full list form


char *epString; /* out */

void encodeTT2000 (tt2000, epString, form) (*Full form)
long long tt2000; /* in */
char *epString; /* out */
int form; /* in */

long long toParseTT2000 (epString)
char *epString; /* in */

parseTT2000 or CDF_TT2000_from_UTC_string
long long parseTT2000 (epString)
char *epString; /* in */

long CDF_TT2000_from_UTC_EPOCH (epoch)
double epoch; /* in */

long CDF_TT2000_from_UTC_EPOCH16 (epoch16)
double *epoch16; /* in */

double CDF_TT2000_to_UTC_EPOCH (tt2000)
long long tt2 000 ; /* in */

double CDF_TT2000_to_UTC_EPOCH16 (tt2000, epoch16)
long long tt2000; /* in */
double *epoch16 **; /** * out */

void TT2000toUnixTime (tt2000, unixTime, numTimes)
long long *tt2000; /* in */
double *epoch16 **; /** * out */
int numTimes; /* in */

void UnixTimetoTT2000 (unixTime, tt2000, numTimes)
double *unixTime **; /** * in */
long long *tt2000; /* out */
int numTimes; /* in */