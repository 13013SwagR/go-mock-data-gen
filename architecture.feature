# Feature: Mock data generator
Generates a set of edge case values for every fields with of a matrix of all their combinations.

## Scenario: cli generates mock data for a function
a function/method takes parameters, 0 or more objects
  when the cli receives the command
  then the command is validated
  then the objects are scanned
  then the fields value ranges are calculated
  then the mock data user defined rules are applied
  then the base value ranges are created
  then the mock data permutations are calculated

filters:
  size: min, max, undermin, overmax
  empty: empty | !empty
  nul: nil | !nil
  true|false: true | false
  numbers: hex, binary, base16, base32, base64
value ranges:
  string:
    alpha, alphanumeric, special characters, utf-8, utf-16, regex, nasty string list
  bool: true|false, nul, empty,
  int: size, true|false, nul, empty
  int8: size, true|false, nul, empty
  int16: size, true|false, nul, empty
  int32: size, true|false, nul, empty
  int64: size, true|false, nul, empty
  uint: size, true|false, nul, empty
  uint8: size, true|false, nul, empty
  uint16: size, true|false, nul, empty
  uint32: size, true|false, nul, empty
  uint64: size, true|false, nul, empty
  uintptr: size, true|false, nul, empty
  byte: // alias for uint8
  rune: // alias for int32
     // represents a Unicode code point
  float32:
  float64:
  complex64:
  complex128:

  ## Implementation
    * code generator service
    * code parsing service
      parser.Read(code string) (string, error)
    * data generator service
      dataGenClient.generate(data_type Type, []filter) (string, error)
    * filtering service
      filteringClient.reduce(data interface{}, type Type) (error)
    * data provider
      dataProvider.GetNames(setList []string)
      dataProvider.GetNumbers(setList) ([]numbers)