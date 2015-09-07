module skadi.components.form.form;
import skadi.components.form.formhelper;
import skadi.components.form.formfield;

abstract class Form
{
    this()
    {
        this.formOptions = [
            "method" : "GET",
            "url" : null
        ];
    }

    void buildForm()
    {
    }

    /**
    * Get form helper
    *
    * @return FormHelper
    */
   FormHelper getFormHelper()
   {
       return this.formHelper;
   }


    /**
     * Rebuild the form from scratch
     *
     * @return $this
     */
    void rebuildForm()
    {
        this.rebuilding = true;

        // If form is plain, buildForm method is empty, so we need to take
        // existing fields and add them again
        foreach (string name, FormField field; this.fields) {
            this.add(name, field.getType(), field.getOptions());
        }

        this.rebuilding = false;
    }

    /**
     * Create a new field and add it to the form
     *
     * @param string $name
     * @param string $type
     * @param array  $options
     * @param bool   $modify
     * @return $this
     */
    Form add(string name, string type = "text", string[string] options = ["method":"GET"], bool modify = false)
    {
        if (this.rebuilding && !this.has(name)) {
            return this;
        }
        this.addField(this.makeField(name, type, options), modify);
        return this;
    }

    /**
     * Create the FormField object
     *
     * @param string $name
     * @param string $type
     * @param array  $options
     * @return FormField
     */
    FormField makeField(string name, string type = "text", string[string] options = ["method":"GET"])
    {
        this.setupFieldOptions(name, options);
        auto fieldName = this.getFieldName(name);
        auto fieldType = this.getFieldType(type);

        return new FormField(fieldName, type, this, options);
    }

    /**
    * Set up options on single field depending on form options
    *
    * @param string $name
    * @param $options
    */
   void setupFieldOptions(string name, string[string] options)
   {
       options["real_name"] = name;
       if (!this.getName()) {
           return;
       }
       /*if (!isset($options['label'])) {
           $options['label'] = $this->formHelper->formatLabel($name);
       }*/
   }

   /**
    * If form is named form, modify names to be contained in single key (parent[child_field_name])
    *
    * @param string $name
    * @return string
    */
   string getFieldName(string name)
   {
       if (this.getName()) {
           return this.getName() ~ "["~name~"]";
       }
       return name;
   }

   /**
    * Disable all fields in a form
    */
   void disableFields()
   {
       foreach (FormField field; this.fields) {
           field.disable();
       }
   }

   /**
    * Enable all fields in a form
    */
   void enableFields()
   {
       foreach (FormField field; this.fields) {
           field.enable();
       }
   }

    /**
    * Add a FormField to the form's fields
    *
    * @param FormField $field
    */
    void addField(FormField field, bool modify = false)
    {
          if (!modify && !this.rebuilding) {
              this.preventDuplicate(field.getRealName());
          }
          this.fields[field.getRealName()] = field;
    }

    /**
    * @param string type
    * @return string
    */
   string getFieldType(string type)
   {
       string fieldType = this.formHelper.getFieldType(type);
       /*if (type == "file") {
           this.formOptions["files"] = true;
       }*/
       return fieldType;
   }

    /**
    * Check if form has field
    *
    * @param $name
    * @return bool
    */
   bool has(string name)
   {
       return (name in this.fields) !is null;
   }

   /**
     * @return string|null
     */
    string getName()
    {
        return this.name;
    }

    /**
     * Prevent adding fields with same name
     *
     * @param string $name
     */
    void preventDuplicate(string name)
    {
        if (this.has(name)) {
              throw new Exception("There is already a form with the name "~name~"!");
        }
    }


protected:

    /**
     * All fields that are added
     *
     * @var array
     */
    FormField[string] fields;

    /**
     * @var FormHelper
     */
    FormHelper formHelper;

    /**
    * Form options
    *
    * @var array
    */
    string[string] formOptions;

    /**
     * Should errors for each field be shown when called form($form) or form_rest($form) ?
     *
     * @var bool
     */
    bool showFieldErrors = true;

    /**
    * Enable html5 validation
    *
    * @var bool
    */
   bool clientValidationEnabled = true;

   /**
    * Name of the parent form if any
    *
    * @var string|null
    */
   string name = null;

   /**
    * @var FormBuilder
    */
   string formBuilder;

   /**
    * @var ValidatorFactory
    */
   string validatorFactory;

   /**
    * @var Validator
    */
   string validator = null;

   /**
    * @var Request
    */
   string request;

   /**
    * List of fields to not render
    *
    * @var array
    **/
   string[] exclude;

   /**
    * Are form being rebuilt?
    *
    * @var bool
    */
   bool rebuilding = false;


}
