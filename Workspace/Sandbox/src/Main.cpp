#include<iostream>
#include<vector>
#include<string>

#include "Symbols.h"

//This New Is Used Only For Debugging Purposes Set The Debugging Flag For The Event System To Use This...
#define _CRTDBG_MAP_ALLOC
#include <stdlib.h>
#include <crtdbg.h>

#include "Log.h"

int main()
{
	//Start Initialize Memory Leak Checking Module..
	int flag = _CrtSetDbgFlag(_CRTDBG_REPORT_FLAG);
	flag |= (_CRTDBG_ALLOC_MEM_DF | _CRTDBG_LEAK_CHECK_DF);
	_CrtSetDbgFlag(flag);
	//Ended Initialize Memory Leak Checking Module..

	_CrtMemState s1,s2;
	_CrtMemCheckpoint(&s1);
	//Start Call Which Example You Want Here//
	{
		std::vector<std::pair<std::string, CreateLogFile>> Configuration;
		Configuration.push_back( std::make_pair("Example1", CreateLogFile::CreateLogFile));
		Log::Init(Configuration); //Init The Log Module..

		//while (true)
		STDOUTDefaultLog_Trace("I Am A Log Message");

		Log::DeInitializeLogSystem();

	}
	_CrtMemCheckpoint(&s2);
	//Ended Call Which Example You Want Here//

	//Start Print Detected Memory Leaks To File..
	FILE* pFile;
	freopen_s(&pFile, "MemoryLeakLog.txt", "w", stdout);
	_CrtSetReportMode(_CRT_WARN, _CRTDBG_MODE_FILE);
	_CrtSetReportFile(_CRT_WARN, _CRTDBG_FILE_STDOUT);
	_CrtDumpMemoryLeaks(); fclose(pFile);
	//_CrtMemDumpStatistics(&s1); fwrite("\n", 1, 1, pFile); _CrtMemDumpStatistics(&s2); This Line Must Be Used Before U Close The File.. before fclose
	//Ended Print Detected Memory Leaks To File..
}