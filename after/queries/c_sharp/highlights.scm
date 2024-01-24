;; extends
(invocation_expression
  (member_access_expression
    expression: (identifier) @CSharpMemberAccess))

;; extends
body: (block
  (expression_statement
    (assignment_expression
      left: (identifier) @CSharpConstructorAssignment)))
