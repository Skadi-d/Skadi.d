/**
 * Skadi.d Web Framework
 * Validation Component

 * Authors: Faianca
 * Copyright: Copyright (c) 2015 Faianca
 * License: MIT License, see LICENSE
 */
module skadi.components.validation.validator;

import skadi.components.validation.validatorInterface;
import skadi.components.validation.validation;
import std.algorithm: canFind;

/**
 * This is a base class for validators
 */
abstract class Validator : ValidatorInterface
{

protected:
    string[string] _options;

public:

    /**
     * Executes the validation
     */
     abstract bool validate(Validation validation, string attribute = null);
}
