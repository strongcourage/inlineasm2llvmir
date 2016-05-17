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
        LLVMContext& m_context = getGlobalContext();
        Function *lift = nullptr;
        for(Module::iterator fi = mod.begin(), fe = mod.end(); fi != fe; ++fi) {
            if (fi->getName().find("_x86_64_lifted_function") != std::string::npos) {
                errs() << "lifted_function: " << *fi << "\n";
                lift = fi;
            }
        }

        for(Module::iterator fi = mod.begin(), fe = mod.end(); fi != fe; ++fi) {
            for(Function::iterator bb = fi->begin(), be = fi->end(); bb != be; ++bb) {
                for(BasicBlock::iterator i = bb->begin(), e = bb->end(); i != e; ++i) {
                    if (isa<CallInst>(i)) {
                        // errs() << "lifted_inline_asm function: " << *i << "\n";
                        CallInst *ci = dyn_cast<CallInst>(i);
                        Function *funcCall = dyn_cast<CallInst>(ci)->getCalledFunction();
                        if (funcCall) {
                            // errs() << "call function: " << funcCall->getName(); 
                            if (funcCall->getName().find("inline_asm") != std::string::npos) {
                                errs() << "Find @inline_asm: " << *ci << "\n";
                                std::vector<Value*> lifted_params;
                                Value *param0 = ci->getArgOperand(0);
                                Value *param1 = ci->getArgOperand(1);
                                Value *param2 = ci->getArgOperand(2);
                                Value *param3 = ci->getArgOperand(3);
                                Value *param4 = ci->getArgOperand(4);
                                Value *param5 = ci->getArgOperand(5);
                                lifted_params.push_back(param0);
                                lifted_params.push_back(param1);
                                lifted_params.push_back(param2);
                                lifted_params.push_back(param3);
                                lifted_params.push_back(param4);
                                lifted_params.push_back(param5);
                                
                                BasicBlock::iterator ii(ci);
                                errs() << "name: " << ci->getName() << "\n";
                                CallInst *newLiftedFunc = CallInst::Create(lift, lifted_params, "zzz");
                                errs() << "newLiftedFunc:" << *newLiftedFunc << "\n";
                                ReplaceInstWithInst(bb->getInstList(), ii, newLiftedFunc);
                                // Function *funcCall = dyn_cast<CallInst>(i)->getCalledFunction();
                                // if (funcCall->getName().find("dung") != std::string::npos) {
                                //     errs() << "manh_dung: " << *funcCall << "\n";
                                // }
                            }
                        }
                    }
                }
            }
        }

        return true;
    }   
};

}

char DoPostProcessing::ID = 0;
static RegisterPass<DoPostProcessing> X("dopostprocessing", "DoPostProcessing Pass");