-- Perform various mathematical operations and calculations
SELECT 
  -- Absolute value of -10, aliased as Absolute_Value
  ABS(-10) AS Absolute_Value,

  -- Round 76.12 up to the nearest integer, aliased as Rounded_Up
  CEILING(76.12) AS Rounded_Up,

  -- Round 76.12 down to the nearest integer, aliased as Rounded_Down
  FLOOR(76.12) AS Rounded_Down,

  -- Get the sign of 34, aliased as Sign_Of_34
  SIGN(34) AS Sign_Of_34,

  -- Get the sign of -34, aliased as Sign_Of_Minus34
  SIGN(-34) AS Sign_Of_Minus34,

  -- Get the sign of 0, aliased as Sign_Of_Zero
  SIGN(0) AS Sign_Of_Zero,

  -- Square root of 5, aliased as SquareRootOf5, and square root of 81, aliased as SquareRootOf81
  SQRT(5) AS SquareRootOf5, SQRT(81) AS SquareRootOf81,

  -- Various mathematical functions combined, including Pi, cosine, sine, and tangent
  PI() AS PiValue, COS(30) AS CosineOf30, SIN(90) AS SineOf90, TAN(45) AS TangentOf45,

  -- Calculate e raised to the power of 2, aliased as ResultOfExp2
  EXP(2) AS ResultOfExp2;
