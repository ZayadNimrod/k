module MACRO-VARS-SYNTAX
endmodule
module MACRO-VARS
  imports MACRO-VARS-SYNTAX
  imports DOMAINS
  syntax KResult ::= Int | Bool
  syntax CPPType ::= bar(Set, CPPSimpleType)
  syntax CPPSimpleType ::= scopedEnum() | unscopedEnum()
  syntax Foo ::= foo(CPPType)
  syntax K ::= inverseConvertType(CPPType, Foo) [function]
  rule inverseConvertType(cppEnumType, foo((cppEnumType #as T::CPPType => underlyingType(T))))
  syntax CPPType ::= underlyingType(CPPType) [function]
  syntax CPPType ::= "cppEnumType"
  rule cppEnumType => bar(_, scopedEnum() #Or unscopedEnum() ) [macro, unboundVariables(_)]
endmodule