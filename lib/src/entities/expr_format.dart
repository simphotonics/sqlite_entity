/// Used to indicate how an expression will be rendered.
///  * FUNCTION: => `OperatorSymbol`(left-operand, right-operand).
///  * OPERATOR: => left-operand `OperatorSymbol` right-operand.
enum ExprFormat { function, operator }
