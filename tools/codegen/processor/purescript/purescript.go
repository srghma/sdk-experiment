package purescript

import (
	"embed"
	"fmt"
	"io/fs"
	"strings"
	"unicode"

	"github.com/nhost/sdk-experiment/tools/codegen/format"
	"github.com/nhost/sdk-experiment/tools/codegen/processor"
)

const extCustomType = "x-ps-type"

//go:embed templates/*.tmpl
var templatesFS embed.FS

type Purescript struct{}

func (p *Purescript) GetTemplates() fs.FS {
	return templatesFS
}

// Purescript record field names should be camelCase
func recordFieldName(name string) string {
    parts := strings.FieldsFunc(name, func(r rune) bool {
        return r == '-' || r == '_'
    })

    if len(parts) == 0 {
        parts = []string{name}
    }

    result := strings.ToLower(parts[0])
    for i := 1; i < len(parts); i++ {
        if len(parts[i]) > 0 {
            result += strings.ToUpper(string(parts[i][0])) + strings.ToLower(parts[i][1:])
        }
    }

    reserved := map[string]bool{
        "type": true, "module": true, "case": true, "class": true,
        "data": true, "newtype": true, "instance": true, "let": true,
        "in": true, "where": true, "do": true, "if": true, "then": true,
        "else": true, "foreign": true, "import": true, "as": true,
        "infix": true, "infixl": true, "infixr": true,
    }

    if reserved[result] {
        result += "_"
    }

    return result
}

// Purescript type names should be PascalCase
func typeName(name string) string {
	return format.ToCamelCase(name)
}

// Convert to lowercase with first letter
func lowerFirst(s string) string {
	if len(s) == 0 {
		return s
	}
	r := []rune(s)
	r[0] = unicode.ToLower(r[0])
	return string(r)
}

// Helper to check if type needs parentheses
func needsParentheses(typeName string) bool {
	return strings.Contains(typeName, " ")
}

// Helper to check if comment/description is empty or meaningless
func hasValidDescription(description string) bool {
	if description == "" {
		return false
	}
	trimmed := strings.TrimSpace(description)
	return trimmed != "" && trimmed != "-" && trimmed != "nil"
}

// Check if string has prefix
func hasPrefix(s, prefix string) bool {
	return strings.HasPrefix(s, prefix)
}

// Convert enum value (from API) to PureScript constructor name
func enumValueToConstructor(value interface{}) string {
	if s, ok := value.(string); ok {
		// Convert kebab-case, snake_case, or camelCase to PascalCase
		return format.ToCamelCase(s)
	}
	return fmt.Sprintf("Value%v", value)
}

// Convert enum value to JSON string representation
func enumValueToJsonString(value interface{}) string {
	if s, ok := value.(string); ok {
		return fmt.Sprintf("\"%s\"", s)
	}
	return fmt.Sprintf("\"%v\"", value)
}

// Map Go/OpenAPI types to PureScript codec functions
func getCodecForScalarType(scalarType string, format string) string {
	switch scalarType {
	case "integer":
		return "CJ.int"
	case "number":
		return "CJ.number"
	case "string":
		if format == "binary" {
			return "CJ.string" // Blob as base64 string in JSON
		}
		return "CJ.string"
	case "boolean":
		return "CJ.boolean"
	case "null":
		return "CJ.null"
	default:
		return "CJ.string" // fallback
	}
}

func (p *Purescript) GetFuncMap() map[string]any {
	return map[string]any{
		"recordFieldName":          recordFieldName,
		"typeName":                typeName,
		"lowerFirst":              lowerFirst,
		"needsParentheses":        needsParentheses,
		"hasValidDescription":     hasValidDescription,
		"hasPrefix":               hasPrefix,
		"getCodecForScalarType":   getCodecForScalarType,
		"enumValueToConstructor":  enumValueToConstructor,
		"enumValueToJsonString":   enumValueToJsonString,
	}
}

func (p *Purescript) TypeObjectName(name string) string {
	return typeName(name)
}

func (p *Purescript) TypeScalarName(scalar *processor.TypeScalar) string {
	switch scalar.Schema().Schema().Type[0] {
	case "integer":
		return "Int"
	case "number":
		return "Number"
	case "string":
		if scalar.Schema().Schema().Format == "binary" {
			return "Blob"
		}
		return "String"
	case "boolean":
		return "Boolean"
	case "null":
		return "Unit"
	case "void":
		return "Unit"
	}
	return "String"
}

func (p *Purescript) TypeArrayName(array *processor.TypeArray) string {
	return "Array " + array.Item.Name()
}

func (p *Purescript) TypeEnumName(name string) string {
	return typeName(name)
}

func (p *Purescript) TypeEnumValues(values []any) []string {
	enumValues := make([]string, len(values))
	if len(values) == 0 {
		return enumValues
	}

	for i, v := range values {
		if s, ok := v.(string); ok {
			enumValues[i] = typeName(s)
		} else {
			enumValues[i] = fmt.Sprintf("Value%v", v)
		}
	}

	return enumValues
}

func (p *Purescript) TypeMapName(schema *processor.TypeMap) string {
	if v, ok := schema.Schema().Schema().Extensions.Get(extCustomType); ok {
		return v.Value
	}
	return "J.JObject"
}

func (p *Purescript) MethodName(name string) string {
	return format.ToCamelCase(name) // Preserve proper camelCase
}

func (p *Purescript) MethodPath(name string) string {
	return strings.ReplaceAll(name, "{", "${")
}

func (p *Purescript) ParameterName(name string) string {
	return recordFieldName(name)
}

func (p *Purescript) BinaryType() string {
	return "Blob"
}

// Modified property name to handle array fields correctly
func (p *Purescript) PropertyName(name string) string {
    // Handle array notation like "metadata[]" and "file[]"
    if strings.HasSuffix(name, "[]") {
        baseName := strings.TrimSuffix(name, "[]")
        return recordFieldName(baseName) + "Array"
    }

    // Handle kebab-case from multipart field names
    if strings.Contains(name, "-") {
        return recordFieldName(name)
    }

    return recordFieldName(name)
}
