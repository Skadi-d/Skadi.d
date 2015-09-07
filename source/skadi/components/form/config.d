module skadi.components.form.config;

struct Config
{
     string wrapper;
     string[string] attr;
}


string[string] getDefaultConfig()
{
    string[string] formDefaults;

    formDefaults["wrapper_class"] = "form-group";
    formDefaults["wrapper_error_class"] = "has-error";
    formDefaults["label_class"] = "control-label";
    formDefaults["field_class"] = "form-control";
    formDefaults["help_block_class"] = "help-block";
    formDefaults["error_class"] = "text-danger";
    formDefaults["required_class"] = "required";

    return formDefaults;
}

string[string] getForms()
{
    string[string] forms;

    forms["form"] = "form-group";
    forms["text"] = "form-group";
    forms["textarea"] = "form-group";
    forms["button"] = "form-group";
    forms["radio"] = "form-group";
    forms["checkbox"] = "form-group";
    forms["select"] = "form-group";
    forms["choice"] = "form-group";
    forms["repeated"] = "form-group";
    forms["child_form"] = "form-group";
    forms["collection"] = "form-group";
    forms["static"] = "form-group";


    return forms;
}
