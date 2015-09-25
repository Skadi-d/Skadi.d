module Application.PostBundle.Forms.contactform;

import skadi.components.form.form;
import skadi.components.form.elements.text;
import skadi.components.validation.all;
import std.stdio;


class ContactForm : Form
{
    this()
    {
        auto name = new Text("name");

    	auto options = StringOptions();
    		 options.min = 1;
    		 options.max = 50;

    	name.addValidator(new StringLength(options));

        this.add(name);
        this.add(new Text("telephone"));
    }

    /**
	 * Renders a specific item in the form
	 */
	override string render(string name)
	{
		if (name !in this._elements) {
			throw new Exception("Element with ID=" ~ name ~ " is not part of the form");
		}
    
		return this._elements[name].render();
	}
}

unittest
{
    auto form = new ContactForm();
	string[string] testinput = ["name": "a"];
	string[string] testinput2 = ["name": ""];

    assert(form.isValid(testinput) == true);
    assert(form.isValid(testinput2) == false);
}
