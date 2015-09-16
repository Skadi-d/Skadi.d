/**
 * Skadi.d Web Framework
 * Validation Component

 * Authors: Faianca
 * Copyright: Copyright (c) 2015 Faianca
 * License: MIT License, see LICENSE
 */
module skadi.components.validation.validatorInterface;

import skadi.components.validation.validation;

interface ValidatorInterface
{
	/**
	 * Executes the validation
	 */
	bool validate(Validation validation, string attribute = null);
}
