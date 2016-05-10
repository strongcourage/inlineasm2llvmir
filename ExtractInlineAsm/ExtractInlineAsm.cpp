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

#define DEBUG_TYPE "ExtractInlineAsm"
#include "llvm/Pass.h"
#include "llvm/IR/Value.h"
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
    struct ExtractInlineAsm : public ModulePass {
        static char ID; // Pass identification, replacement for typeid
        ExtractInlineAsm() : ModulePass(ID) {}

        virtual bool runOnModule(Module &mod) {
            LLVMContext& m_context = getGlobalContext();

            // iterate all functions, all basic blocks and all instructions to detect inline assembly instruction
            for(Module::iterator fi = mod.begin(), fe = mod.end(); fi != fe; ++fi) {
                for(Function::iterator bb = fi->begin(), be = fi->end(); bb != be; ++bb) {
                    Value *param = nullptr;
                    CallInst *ci_asm = nullptr;
                    for(BasicBlock::iterator i = bb->begin(), e = bb->end(); i != e; ++i) {
                        // is a call instruction ?
                        if (isa<CallInst>(i)) {
                            ci_asm = dyn_cast<CallInst>(i);
                            // is a inline asm instruction ?
                            if (ci_asm->isInlineAsm()){
                                errs() << "inline asm function: " << *ci_asm << "\n";

                                int numArgs = ci_asm->getNumArgOperands();
                                errs() << "getNumArgOperands: " << numArgs << "\n";
                                for (int i=0; i<numArgs; ++i) {
                                    param = ci_asm->getArgOperand(i);
                                    errs() << "param " << i << " : " << *param << "\n";
                                }

                                Value *calledValue = ci_asm->getCalledValue();
                                errs() << "calledValue: " << *calledValue << "\n";
                                errs() << "getType of calledValue: " << *calledValue->getType() << "\n";

                                InlineAsm *iasm = dyn_cast<InlineAsm>(calledValue);
                                errs() << "getAsmString : " << iasm->getAsmString() << "\n";
                                errs() << "hasSideEffects : " << iasm->hasSideEffects() << "\n";
                                errs() << "getConstraintString : " << iasm->getConstraintString() << "\n";

                                InlineAsm::ConstraintInfoVector constraintInfo = iasm->ParseConstraints();
                                for(vector<InlineAsm::ConstraintInfo>::iterator vi = constraintInfo.begin(); vi != constraintInfo.end(); ++vi) {
                                    // ConstraintPrefix: isInput: 0, isOutput: 1, isClobber: 2
                                    errs() << "Type: " << vi->Type << "\n";
                                    // errs() << "MatchingInput: " << vi->MatchingInput << "\n";
                                    InlineAsm::ConstraintCodeVector codes = vi->Codes;
                                    for(vector<string>::iterator vicode = codes.begin(); vicode != codes.end(); ++vicode) {
                                        errs() << "Codes: " << *vicode << "\n";
                                    }
                                }

                                // for each inline asm function, create a new corresponding function which has same signature
                                vector<Type*> lifted_type_params;
                                vector<Value*> lifted_params;
                                for (int i=0; i<numArgs; ++i) {
                                    lifted_params.push_back(ci_asm->getArgOperand(i));
                                    lifted_type_params.push_back(ci_asm->getArgOperand(i)->getType());
                                }

                                // insert a lifted inline asm function, just a function declaration (extern)
                                FunctionType *functype_declareCall = FunctionType::get(IntegerType::get(m_context, 64), lifted_type_params, false); 
                                Function *func_declareCall = Function::Create(functype_declareCall, Function::ExternalLinkage, "lifted_inline_asm", &mod);

                                // create a new module, which contains the definition of the lifted inline asm function
                                Module* newMod = new Module("inline_asm", getGlobalContext());
                                // TODO: replace IntegerType::get(m_context, 64) by Type* of return value of inline asm function
                                FunctionType *functype_extractCall = FunctionType::get(IntegerType::get(m_context, 64), lifted_type_params, false); 
                                Function *func_extractCall = Function::Create(functype_extractCall, Function::ExternalLinkage, "lifted_inline_asm", newMod);

                                BasicBlock *basicBlock = BasicBlock::Create(m_context, "entry", func_extractCall);
                                IRBuilder<> builder(basicBlock);
                                builder.SetInsertPoint(basicBlock);
                                builder.CreateRet(ConstantInt::get(IntegerType::get(m_context, 64), 0));

                                errs() << "extracted function definition: " << *func_extractCall << "\n";
                                errs() << "new module: " << *newMod << "\n";

                                // in the origin module, replace the inline asm function by the lifted function, which takes the same input parameters 
                                CallInst *replaceCall = CallInst::Create(func_declareCall, lifted_params, "a"); // if I remove "a", it will be <badref> = ... ???
                                errs() << "replaced call:" << *replaceCall << "\n";
                                IRBuilder<> bb_builder(bb);
                                BasicBlock::iterator ii(ci_asm);
                                ReplaceInstWithInst(bb->getInstList(), ii, replaceCall);
                                errs() << "origin module: " << mod << "\n";
                                // TODO: remove return
                                return true;
                            }
                        }
                    }

                }
            }
            return true;
        }   
    };
}

char ExtractInlineAsm::ID = 0;
static RegisterPass<ExtractInlineAsm> X("extractinlineasm", "ExtractInlineAsm Pass");