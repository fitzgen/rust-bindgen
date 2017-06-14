#!/usr/bin/env bash

set -xeu

INPUT=./js.hpp
OUTPUT=./js.rs

DEBUG_BINDGEN=~/rust-bindgen/target/debug/bindgen
RELEASE_BINDGEN=~/rust-bindgen/target/release/bindgen

# Enable backtraces.
export RUST_BACKTRACE=1

# Add libclang to linker's path.
export LD_LIBRARY_PATH=~/src/llvm/obj/lib

# # Ensure that the input file is valid C++ by compiling it to an object file. We
# # only care about running bindgen on valid C++ files.
# clang++ --std=c++14 -c $INPUT

##################### ONLY CHANGE BELOW ###############################

grep CallArgsBase "$INPUT"

# Ensure that the input file is valid C++ by compiling it to an object file. We
# only care about running bindgen on valid C++ files.
clang++ --std=c++14 -c $INPUT

# BINDGEN=$DEBUG_BINDGEN
BINDGEN="$RELEASE_BINDGEN"

# "$BINDGEN" \
#     '--whitelist-type' \
#     'JS::AutoCheckCannotGC' \
#     '--whitelist-type' \
#     'JS::AutoIdVector' \
#     '--whitelist-type' \
#     'JS::AutoObjectVector' \
#     '--whitelist-type' \
#     'JS::CallArgs' \
#     '--whitelist-type' \
#     'js::Class' \
#     '--whitelist-type' \
#     'JS::CompartmentOptions' \
#     '--whitelist-type' \
#     'js::ContextFriendFields' \
#     '--whitelist-type' \
#     'JS::ContextOptions' \
#     '--whitelist-type' \
#     'js::ESClass' \
#     '--whitelist-type' \
#     'JS::ForOfIterator' \
#     '--whitelist-type' \
#     'JS::Handle' \
#     '--whitelist-type' \
#     'JS::HandleId' \
#     '--whitelist-type' \
#     'JS::HandleObject' \
#     '--whitelist-type' \
#     'JS::HandleString' \
#     '--whitelist-type' \
#     'JS::HandleValue' \
#     '--whitelist-type' \
#     'JS::HandleValueArray' \
#     '--whitelist-type' \
#     'JS::Heap' \
#     '--whitelist-type' \
#     'JS::IsAcceptableThis' \
#     '--whitelist-type' \
#     'JSAutoCompartment' \
#     '--whitelist-type' \
#     'JSClass' \
#     '--whitelist-type' \
#     'JSClassOps' \
#     '--whitelist-type' \
#     'JSContext' \
#     '--whitelist-type' \
#     'JSErrorCallback' \
#     '--whitelist-type' \
#     'JSErrorFormatString' \
#     '--whitelist-type' \
#     'JSErrorReport' \
#     '--whitelist-type' \
#     'JSExnType' \
#     '--whitelist-type' \
#     'JSFlatString' \
#     '--whitelist-type' \
#     'JSFunction' \
#     '--whitelist-type' \
#     'JSFunctionSpec' \
#     '--whitelist-type' \
#     'JSGCParamKey' \
#     '--whitelist-type' \
#     'JSJitGetterCallArgs' \
#     '--whitelist-type' \
#     'JSJitMethodCallArgs' \
#     '--whitelist-type' \
#     'JSJitSetterCallArgs' \
#     '--whitelist-type' \
#     'JSNativeWrapper' \
#     '--whitelist-type' \
#     'JSPropertySpec' \
#     '--whitelist-type' \
#     'JSProtoKey' \
#     '--whitelist-type' \
#     'JSObject' \
#     '--whitelist-type' \
#     'JSString' \
#     '--whitelist-type' \
#     'JSScript' \
#     '--whitelist-type' \
#     'JSType' \
#     '--whitelist-type' \
#     'JS::JSValueTag' \
#     '--whitelist-type' \
#     'JS::JSValueType' \
#     '--whitelist-type' \
#     'jsid' \
#     '--whitelist-type' \
#     'jsval_layout' \
#     '--whitelist-type' \
#     'JS::Latin1Char' \
#     '--whitelist-type' \
#     'JS::detail::MaybeWrapped' \
#     '--whitelist-type' \
#     'JS::MutableHandle' \
#     '--whitelist-type' \
#     'JS::MutableHandleObject' \
#     '--whitelist-type' \
#     'JS::MutableHandleValue' \
#     '--whitelist-type' \
#     'JS::NativeImpl' \
#     '--whitelist-type' \
#     'JS::ObjectOpResult' \
#     '--whitelist-type' \
#     'JS::ForOfIterator::NonIterableBehavior' \
#     '--whitelist-type' \
#     'JS::PersistentRooted' \
#     '--whitelist-type' \
#     'JS::ReadOnlyCompileOptions' \
#     '--whitelist-type' \
#     'JS::Rooted' \
#     '--whitelist-type' \
#     'JS::RootedObject' \
#     '--whitelist-type' \
#     'JS::RootKind' \
#     '--whitelist-type' \
#     'JS::ServoSizes' \
#     '--whitelist-type' \
#     'JS::SourceBufferHolder' \
#     '--whitelist-type' \
#     'JS::Symbol' \
#     '--whitelist-type' \
#     'JS::TraceKind' \
#     '--whitelist-type' \
#     'JS::Value' \
#     '--whitelist-type' \
#     'JS::Value::PayloadType' \
#     '--whitelist-type' \
#     'JS::WarningReporter' \
#     '--whitelist-type' \
#     'JS::shadow::Zone' \
#     '--whitelist-type' \
#     'JS::Zone' \
#     '--whitelist-var' \
#     'JSCLASS_.*' \
#     '--whitelist-var' \
#     'JSID_VOID' \
#     '--whitelist-var' \
#     'JSPROP_.*' \
#     '--whitelist-var' \
#     'JS::NullHandleValue' \
#     '--whitelist-var' \
#     'JS::UndefinedHandleValue' \
#     '--whitelist-function' \
#     'JS::ContextOptionsRef' \
#     '--whitelist-function' \
#     'JS::Evaluate' \
#     '--whitelist-function' \
#     'JS::HeapObjectPostBarrier' \
#     '--whitelist-function' \
#     'JS::HeapValuePostBarrier' \
#     '--whitelist-function' \
#     'JS::InitSelfHostedCode' \
#     '--whitelist-function' \
#     'JS_BeginRequest' \
#     '--whitelist-function' \
#     'JS_DefineElement' \
#     '--whitelist-function' \
#     'JS_DefineFunctions' \
#     '--whitelist-function' \
#     'JS_DefineProperties' \
#     '--whitelist-function' \
#     'JS_DestroyContext' \
#     '--whitelist-function' \
#     'JS_EndRequest' \
#     '--whitelist-function' \
#     'JS_EnterCompartment' \
#     '--whitelist-function' \
#     'JS_GetLatin1StringCharsAndLength' \
#     '--whitelist-function' \
#     'JS_GetTwoByteStringCharsAndLength' \
#     '--whitelist-function' \
#     'JS_GlobalObjectTraceHook' \
#     '--whitelist-function' \
#     'JS::detail::InitWithFailureDiagnostic' \
#     '--whitelist-function' \
#     'JS_LeaveCompartment' \
#     '--whitelist-function' \
#     'JS_NewArrayObject' \
#     '--whitelist-function' \
#     'JS_NewContext' \
#     '--whitelist-function' \
#     'JS_NewUCStringCopyN' \
#     '--whitelist-function' \
#     'JS_ReportErrorNumberUTF8' \
#     '--whitelist-function' \
#     'JS_SetGCParameter' \
#     '--whitelist-function' \
#     'JS_SetNativeStackQuota' \
#     '--whitelist-function' \
#     'JS_StringHasLatin1Chars' \
#     '--whitelist-function' \
#     'JS_WrapValue' \
#     '--whitelist-function' \
#     'JS::SetWarningReporter' \
#     '--whitelist-function' \
#     'js::ToBooleanSlow' \
#     '--whitelist-function' \
#     'js::ToInt32Slow' \
#     '--whitelist-function' \
#     'js::ToInt64Slow' \
#     '--whitelist-function' \
#     'js::ToNumberSlow' \
#     '--whitelist-function' \
#     'js::ToStringSlow' \
#     '--whitelist-function' \
#     'js::ToUint16Slow' \
#     '--whitelist-function' \
#     'js::ToUint32Slow' \
#     '--whitelist-function' \
#     'js::ToUint64Slow' \
#     '--whitelist-type' \
#     'mozilla::detail::Guard.*' \
#     '--enable-cxx-namespaces' \
#     -o "$OUTPUT" \
#     "$INPUT" \
#     --raw-line "#![feature(untagged_unions)]" \
#     '--' \
#     '-x' \
#     'c++' \
#     '-std=c++14' \
#     '-DRUST_BINDGEN' \
#     '-DDEBUG' \
#     '-DJS_DEBUG'

# --emit-ir \
#     --emit-ir-graphviz $(mktemp -t ir.dot.XXXXXX) \
#     --emit-clang-ast \

"$BINDGEN" \
    "$INPUT" \
    -o "$OUTPUT" \
    --enable-cxx-namespaces \
    --whitelist-type 'JS::ReadOnlyCompileOptions' \
    --raw-line "#![feature(untagged_unions)]" \
    '--' \
    '-std=c++14' \
    '-DDEBUG' \
    '-DJS_DEBUG'


grep "CallArgsBase" "$OUTPUT" 

rustc --crate-type lib --test "$OUTPUT"

"${OUTPUT%.*}" 2>&1 | grep "__bindgen_test_layout_CallArgsBase_.*' panicked at 'assertion failed: \`(left == right)\` (left: \`24\`, right: \`16\`)"
