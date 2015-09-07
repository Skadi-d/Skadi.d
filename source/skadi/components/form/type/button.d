module skadi.components.form.type.button;

import skadi.components.form.config;
import skadi.components.form.form;
import skadi.components.form.formfield;

class ButtonType : FormField
{

    /**
     * @param             name
     * @param             type
     * @param Form        parent
     * @param array       options
     */
    this(string name, string type, Form parent, FormOptions options)
    {
        super(name, type, parent, options);
    }

protected:

    /**
     * @inheritdoc
     */
    override string getTemplate()
    {
        return "button";
    }

    /**
     * @inheritdoc
     */
    override Config getDefaults()
    {
        return Config(null, ["type" : this.type ]);
    }
}
