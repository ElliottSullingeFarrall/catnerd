{ lib
, ...
}:

{
  # string -> string
  # this removes the first letter in a string,
  # which is sometimes needed in order to format
  # the colours correctly
  mkColour = str:
    builtins.substring 1 (builtins.stringLength str) str;

  # string -> string
  # this capitalizes the first letter in a string,
  # which is sometimes needed in order to format
  # the names of themes correctly
  mkUpper = str:
    (lib.toUpper (builtins.substring 0 1 str)) + (builtins.substring 1 (builtins.stringLength str) str);
}
