//===- InlineAsm.cpp - Example code from "Writing an LLVM Pass" ---------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file implements two versions of the LLVM "Hello World" pass described
// in docs/WritingAnLLVMPass.html
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
            
            FunctionType *functype_sum = FunctionType::get(IntegerType::get(m_context, 64), std::vector<llvm::Type*>(6, IntegerType::get(m_context, 64)), false); 
            Function *func_sum = Function::Create(functype_sum, Function::PrivateLinkage, "manh_dung", &mod);
            BasicBlock *basicBlock = BasicBlock::Create(m_context, "entry", func_sum);
            IRBuilder<> builder(basicBlock);
            builder.SetInsertPoint(basicBlock);
            builder.CreateRet(ConstantInt::get(IntegerType::get(m_context, 64), 0));

            Function *func_main = mod.getFunction("main");
            Function *lift = nullptr;
            for(Module::iterator fi = mod.begin(), fe = mod.end(); fi != fe; ++fi) {
                if (fi->getName().find("_x86_64_lifted_function") != std::string::npos) {
                    errs() << "lifted_function: " << *fi << "\n";
                    lift = fi;
                }
            }

            // for(Module::iterator fi = mod.begin(), fe = mod.end(); fi != fe; ++fi) {
                for(Function::iterator bb = func_main->begin(), be = func_main->end(); bb != be; ++bb) {
                    for(BasicBlock::iterator i = bb->begin(), e = bb->end(); i != e; ++i) {
                        if (isa<CallInst>(i)) {
                            errs() << "manh_dung: " << *i << "\n";
                            CallInst *ci_asm = dyn_cast<CallInst>(i);
                            std::vector<Value*> lifted_params;
                            Value *param1 = ci_asm->getArgOperand(0);
                            Value *param2 = ci_asm->getArgOperand(1);
                            lifted_params.push_back(param1);
                            lifted_params.push_back(param2);
                            lifted_params.push_back(param1);
                            lifted_params.push_back(param1);
                            lifted_params.push_back(param1);
                            lifted_params.push_back(param1);
                            
                            BasicBlock::iterator ii(ci_asm);
                            errs() << "name: " << ci_asm->getName() << "\n";
                            CallInst *newLiftedFunc = CallInst::Create(lift, lifted_params, "");
                            errs() << "newLiftedFunc:" << *newLiftedFunc << "\n";
                            ReplaceInstWithInst(bb->getInstList(), ii, newLiftedFunc);
                            // Function *funcCall = dyn_cast<CallInst>(i)->getCalledFunction();
                            // if (funcCall->getName().find("dung") != std::string::npos) {
                            //     errs() << "manh_dung: " << *funcCall << "\n";
                            // }
                        }
                    }
                }
            // }

            return true;
        }   
    };
}

char DoPostProcessing::ID = 0;
static RegisterPass<DoPostProcessing> X("dopostprocessing", "DoPostProcessing Pass");