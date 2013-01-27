//
//  objectdoc.m
//  objectdoc
//
//  Created by Landon Fuller on 1/26/13.
//  Copyright (c) 2013 Landon Fuller. All rights reserved.
//

#include <clang/Frontend/FrontendActions.h>
#include <clang/Tooling/CommonOptionsParser.h>
#include <clang/Tooling/Tooling.h>
#include <llvm/Support/CommandLine.h>

#include <dispatch/dispatch.h>

using namespace clang::tooling;
using namespace llvm;

// CommonOptionsParser declares HelpMessage with a description of the common
// command-line options related to the compilation database and input files.
// It's nice to have this help message in all tools.
static cl::extrahelp CommonHelp(CommonOptionsParser::HelpMessage);

// A help message for this specific tool can be added afterwards.
static cl::extrahelp MoreHelp("\nMore help text...");

/*@
 * Run the clang tool
 *
 * @param argc Program argc
 * @param argv Program argv
 */
int RunTool (int argc, const char *argv[]) {
    CommonOptionsParser OptionsParser(argc, argv);
    ClangTool Tool(OptionsParser.getCompilations(), OptionsParser.getSourcePathList());
    return Tool.run(newFrontendActionFactory<clang::SyntaxOnlyAction>());
}

#import "objectdoc.h"

@implementation objectdoc


@end
