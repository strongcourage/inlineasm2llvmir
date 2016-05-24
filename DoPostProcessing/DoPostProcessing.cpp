//===- DoPostProcessing.cpp - LLVM Pass -----------------------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
//
//===----------------------------------------------------------------------===//

#define DEBUG_TYPE "DoPostProcessing"
#include "llvm/Pass.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/InlineAsm.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h" 
#include <vector>
#include <string>
#include <iostream>
using namespace llvm;
using namespace std;

namespace {

struct DoPostProcessing : public ModulePass {
    static char ID; // Pass identification, replacement for typeid
    DoPostProcessing() : ModulePass(ID) {}

    virtual bool runOnModule(Module &mod) {
        Function *lifted_func = nullptr;
        for(Module::iterator fi = mod.begin(), fe = mod.end(); fi != fe; ++fi) {
            if (fi->getName().find("_x86_64_lifted_function") != std::string::npos) {
                errs() << "lifted_function: " << *fi << "\n";
                lifted_func = fi;
            }
        }

        Function *inline_asm_func = mod.getFunction("inline_asm");
	    if (inline_asm_func != nullptr) {
	    	errs() << "Inline asm function: " << *inline_asm_func << "\n";
	    	inline_asm_func->replaceAllUsesWith(lifted_func);
	    	// delete the declaration of the inline asm function
	    	inline_asm_func->eraseFromParent();
	    }

        return true;
    }   
};

}

char DoPostProcessing::ID = 0;
static RegisterPass<DoPostProcessing> X("dopostprocessing", "DoPostProcessing Pass");