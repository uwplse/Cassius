import { esprima } from "./esprima"

export function dump_script(script) {
    var AST = esprima.parseScript(script);
    var code = AST.body[0].body.body;
    var out = ""
    for(var i = 0; i < code.length; i++){
      var stmt = code[i]
      var line = "  "
      if (stmt.type == "VariableDeclaration"){
        var declarator = stmt.declarations[0];
        line = line + "(let"
        var name = declarator.id.name
        line = line + " " + name
        if(declarator.init.callee.property.name == "querySelector"){
          line += " (select (id "
          var selector = declarator.init.arguments[0].value
          line += selector.substring(1) + ")))"
        }
        if(declarator.init.callee.property.name == "createElement"){
          line += " (create "
          var selector = declarator.init.arguments[0].value
          line += "[" + selector + "]))"
        }
      }
      if(stmt.type == "ExpressionStatement"){
        var expr = stmt.expression
        console.log(expr)
        if(expr.type == "AssignmentExpression"){
          line += "(set"
          var lhs = expr.left
          var rhs = expr.right
          console.log(rhs)
          var selector = lhs.object.name
          line += " " + selector + " "
          var member = lhs.property.name
          if (member == "id"){
            line += "\':id" + " " + "havokRHS" + ")"
          }
          if(member == "innerText"){
            line += "\':text" + " " + "havokRHS" + ")"
          }
        }
        if(expr.type == "CallExpression"){
          line += "(append-child "
          var child = expr.arguments[0].name
          var parent = expr.callee.object.name
          line += parent + " " + child + ")"
        }
	}
	if(i != code.length - 1){
	  out = out + line + "\n"
	}
	else {
	  out = out + line
	}
    }
    return out;
}
