module skadi.components.form.formfield;

import skadi.components.form.form;
import skadi.components.form.formhelper;
import skadi.components.form.config;
import std.array;

/**
 * Class FormField
 */
abstract class FormField
{

protected:
    /**
     * Name of the field
     *
     * @var
     */
    string name;

    /**
     * Type of the field
     *
     * @var
     */
    string type;

    /**
     * All options for the field
     *
     * @var FormOptions
     */
    FormOptions options;

    /**
     * Is field rendered
     *
     * @var bool
     */
    bool rendered = false;

    /**
     * @var Form
     */
    Form parent;

    /**
     * @var string
     */
    string[] templates;

    /**
     * @var FormHelper
     */
    FormHelper formHelper;

    /**
     * Name of the property for value setting
     *
     * @var string
     */
    string valueProperty = "value";

    /**
     * Name of the property for default value
     *
     * @var string
     */
    string defaultValueProperty = "default_value";

    /**
     * Is default value set?
     * @var bool
     */
    bool hasDefault = false;

    /**
     * @var \Closure|null
     */
    //clouse valueClosure = null;

    /**
     * Get the attribute value from the model by name
     *
     * @param mixed model
     * @param string name
     * @return mixed
     */
    /*mgetModelValueAttribute(model, name)
    {
        /*transformedName = this.transformKey(name);
        if (is_string(model)) {
            return model;
        } elseif (is_object(model)) {
            return object_get(model, transformedName);
        } elseif (is_array(model)) {
            return array_get(model, transformedName);
        }*
    }

    /**
     * Transform array like syntax to dot syntax
     *
     * @param key
     * @return mixed
     */
    string transformKey(string key)
    {
        return "";
        //return str_replace([".", "[]", "[", "]"], ["_", "", ".", ""], key);
    }

    /**
     * Prepare options for rendering
     *
     * @param array options
     * @return array
     */
    FormOptions prepareOptions(FormOptions options)
    {
        /*helper = this.formHelper;
        this.options = helper.mergeOptions(this.options, options);
        if (this.getOption("attr.multiple") && !this.getOption("tmp.multipleBracesSet")) {
            this.name = this.name."[]";
            this.setOption("tmp.multipleBracesSet", true);
        }
        if (this.parent.haveErrorsEnabled()) {
            this.addErrorClass();
        }
        if (this.getOption("required") === true) {
            lblClass = this.getOption("label_attr.class", "");
            requiredClass = helper.getConfig("defaults.required_class", "required");
            if (!str_contains(lblClass, requiredClass)) {
                lblClass .= " " . requiredClass;
                this.setOption("label_attr.class", lblClass);
                this.setOption("attr.required", "required");
            }
        }
        if (this.parent.clientValidationEnabled() && rules = this.getOption("rules")) {
            rulesParser = new RulesParser(this);
            attrs = this.getOption("attr") + rulesParser.parse(rules);
            this.setOption("attr", attrs);
        }
        this.setOption("wrapperAttrs", helper.prepareAttributes(this.getOption("wrapper")));
        this.setOption("errorAttrs", helper.prepareAttributes(this.getOption("errors")));
        if (this.getOption("is_child")) {
            this.setOption("labelAttrs", helper.prepareAttributes(this.getOption("label_attr")));
        }
        if (this.getOption("help_block.text")) {
            this.setOption(
                "help_block.helpBlockAttrs",
                helper.prepareAttributes(this.getOption("help_block.attr"))
            );
        }
        return this.options;*/
        return options;
    }

    /**
     * Add error class to wrapper if validation errors exist
     */
    void addErrorClass()
    {
        /*errors = this.parent.getRequest().session().get("errors");
        if (errors && errors.has(this.getNameKey())) {
            errorClass = this.formHelper.getConfig("defaults.wrapper_error_class");
            wrapperClass = this.getOption("wrapper.class");
            if (this.getOption("wrapper") && !str_contains(wrapperClass, errorClass)) {
                wrapperClass .= " " . errorClass;
                this.setOption("wrapper.class", wrapperClass);
            }
        }*/
    }

    /**
     * Merge all defaults with field specific defaults and set template if passed
     *
     * @param array options
     */
    void setDefaultOptions(FormOptions options)
    {
        /*this.options = this.formHelper.mergeOptions(this.allDefaults(), this.getDefaults());
        this.options = this.prepareOptions(options);*/
    }

    /**
     * Check if fields needs label
     *
     * @return bool
     */
    bool needsLabel()
    {
        /*// If field is <select> and child of choice, we don"t need label for it
        isChildSelect = this.type == "select" && this.getOption("is_child") === true;
        if (this.type == "hidden" || isChildSelect) {
            return false;
        }*/
        return true;
    }

private:

    /**
     * Defaults used across all fields
     *
     * @return array
     */
    string[][string][string] allDefaults()
    {
        return [
            "wrapper" : [
                "class" : this.formHelper.getConfig("defaults.wrapper_class")
            ]
        ];
        /*return [
            "wrapper" => ["class" => this.formHelper.getConfig("defaults.wrapper_class")],
            "attr" => ["class" => this.formHelper.getConfig("defaults.field_class")],
            "help_block" => ["text" => null, "tag" => "p", "attr" => [
                "class" => this.formHelper.getConfig("defaults.help_block_class")
            ]],
            "value" => null,
            "default_value" => null,
            "label" => this.formHelper.formatLabel(this.getRealName()),
            "is_child" => false,
            "label_attr" => ["class" => this.formHelper.getConfig("defaults.label_class")],
            "errors" => ["class" => this.formHelper.getConfig("defaults.error_class")],
            "rules" => []
        ];*/
    }

    /**
     * Set the template property on the object
     */
    void setTemplate()
    {
        this.templates = this.formHelper.getConfig(this.getTemplate(), this.getTemplate());
    }

public:

    /**
     * @param             name
     * @param             type
     * @param Form        parent
     * @param array       options
     */
    this(string name, string type, Form parent, FormOptions options)
    {
        this.name = name;
        this.type = type;
        this.parent = parent;
        this.formHelper = this.parent.getFormHelper();
        this.setTemplate();
        this.setDefaultOptions(options);
        this.setupValue();
    }

/**
   * Get single option from options array. Can be used with dot notation ('attr.class')
   *
   * @param        $option
   * @param mixed  $default
   *
   * @return mixed
   */
  string getOption(string option, string[] defaults = null)
  {
      return "sdada";
      //return array_get(this.options, option, defaults);
  }

    void setupValue()
    {
        /*value = this.getOption(this.valueProperty);
        isChild = this.getOption("is_child");
        if (value instanceof \Closure) {
            this.valueClosure = value;
        }
        if ((value === null || value instanceof \Closure) && !isChild) {
            this.setValue(this.getModelValueAttribute(this.parent.getModel(), this.name));
        } elseif (!isChild) {
            this.hasDefault = true;
        }*/
    }

    /**
     * Get the template, can be config variable or view path
     *
     * @return string
     */
    //abstract string getTemplate();
    string getTemplate()
    {
        return "";
    }

    /**
     * @return string
     */
    string getViewTemplate()
    {
        return this.getOption("template", this.templates);
    }

    /**
     * @param FormOptions options
     * @param bool  showLabel
     * @param bool  showField
     * @param bool  showError
     * @return string
     */
    string render(FormOptions options, bool showLabel = true, bool showField = true, bool showError = true)
    {
        return "html";
        /*this.prepareOptions(options);
        value = this.getValue();
        defaultValue = this.getDefaultValue();
        if (showField) {
            this.rendered = true;
        }
        // Override default value with value
        if (!value && defaultValue) {
            this.setOption(this.valueProperty, defaultValue);
        }
        if (!this.needsLabel()) {
            showLabel = false;
        }
        if (showError) {
            showError = this.parent.haveErrorsEnabled();
        }
        return this.formHelper.getView().make(
            this.getViewTemplate(),
            [
                "name" => this.name,
                "nameKey" => this.getNameKey(),
                "type" => this.type,
                "options" => this.options,
                "showLabel" => showLabel,
                "showField" => showField,
                "showError" => showError
            ]
        ).render();*/
    }



    /**
     * Get name of the field
     *
     * @return string
     */
    string getName()
    {
        return this.name;
    }

    /**
     * Set name of the field
     *
     * @param string name
     */
    void setName(string name)
    {
        this.name = name;
    }

    /**
     * Get dot notation key for fields
     *
     * @return string
     **/
    string getNameKey()
    {
        return this.transformKey(this.name);
    }

    /**
     * Get field options
     *
     * @return FormOptions
     */
    FormOptions getOptions()
    {
        return this.options;
    }

    /**
     * Get single option from options array. Can be used with dot notation ("attr.class")
     *
     * @param        option
     * @param mixed  default
     *
     * @return mixed
     */
    /*string[string] getOption(option, default = null)
    {
        return array_get(this.options, option, default);
    }*/

    /**
     * Set field options
     *
     * @param array options
     */
    void setOptions(FormOptions options)
    {
        this.options = this.prepareOptions(options);
    }

    /**
     * Set single option on the field
     *
     * @param string name
     * @param mixed value
     * @return this
     */
    void setOption(string name, string value)
    {
        //array_set(this.options, name, value);
    }

    /**
     * Get the type of the field
     *
     * @return string
     */
    string getType()
    {
        return this.type;
    }

    /**
     * Set type of the field
     *
     * @param mixed type
     * @return this
     */
    void setType(string type)
    {
        if (this.formHelper.getFieldType(type)) {
            this.type = type;
        }
    }

    /**
     * @return Form
     */
    Form getParent()
    {
        return this.parent;
    }

    /**
     * Check if the field is rendered
     *
     * @return bool
     */
    bool isRendered()
    {
        return this.rendered;
    }

    /**
     * Default options for field
     *
     * @return array
     */
    Config getDefaults()
    {
        return this.config;
    }

    /**
     * Get real name of the field without form namespace
     *
     * @return string
     */
    string getRealName()
    {
        return this.getOption("real_name", this.name);
    }

    /**
     * @param value
     * @return this
     */
    void setValue(string value)
    {
        /*if (this.hasDefault) {
            return this;
        }
        closure = this.valueClosure;
        /*if (closure instanceof \Closure) {
            value = closure(value ?: null);
        }*
        if (value === null || value === false) {
            value = this.getOption(this.defaultValueProperty);
        }
        this.options[this.valueProperty] = value;*/
    }

    /**
     * Disable field
     *
     * @return this
     */
    void disable()
    {
        this.setOption("attr.disabled", "disabled");
    }

    /**
     * Enable field
     *
     * @return this
     */
    void enable()
    {
        //array_forget(this.options, "attr.disabled");
    }

    /**
     * Get validation rules for a field if any with label for attributes
     *
     * @return array|null
     */
    void getValidationRules()
    {
        /*rules = this.getOption("rules", []);
        name = this.getNameKey();
        if (!rules) {
            return null;
        }
        return [
            "rules" => [name => rules],
            "attributes" => [name => this.getOption("label")]
        ];*/
    }

    /**
     * Get value property
     *
     * @param mixed|null default
     * @return mixed
     */
    void getValue(string _default = null)
    {
        /*return this.getOption(this.valueProperty, _default);*/
    }

    /**
     * Get default value property
     *
     * @param mixed|null default
     * @return mixed
     */
    void getDefaultValue(string _default = null)
    {
        /*return this.getOption(this.defaultValueProperty, _default);*/
    }

}
