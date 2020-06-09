#pragma once
#include<iostream>
#include<vector>
#include<string>

#include "Log.h"

void PrintMsgs()
{

}

void Example1Main()
{
	std::vector<std::pair<std::string, CreateLogFile>> Configuration;
	Configuration.push_back({ "Example1", CreateLogFile::CreateLogFile });

	Log::Init(Configuration); //Init The Log Module..

	STDOUTDefaultLog_Trace("I Am A Log Message");
}