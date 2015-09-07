module skadi.components.form.formhelper;

class FormHelper
{

    this(string view, string request, string[string] config)
    {
        this.view = view;
        this.request = request;
        this.config = config;
    }

    /*string[] getConfig(string key)
    {
        return this.config[key];
    }*/

    string getView()
    {
        return this.view;
    }

    /**
     * @param string $key
     * @param string $default
     * @return mixed
     */
    string[] getConfig(string key, string defaults = null)
    {
        return array_get(this.config, key, defaults);
    }

   string getFieldType(string type)
   {
       /*$types = array_keys(static::$availableFieldTypes);
       if (!$type || trim($type) == '') {
           throw new \InvalidArgumentException('Field type must be provided.');
       }
       if (array_key_exists($type, $this->customTypes)) {
           return $this->customTypes[$type];
       }
       if (!in_array($type, $types)) {
           throw new \InvalidArgumentException(
               sprintf(
                   'Unsupported field type [%s]. Available types are: %s',
                   $type,
                   join(', ', array_merge($types, array_keys($this->customTypes)))
               )
           );
       }
       $namespace = __NAMESPACE__.'\\Fields\\';
       return $namespace . static::$availableFieldTypes[$type];*/
   }

protected:
    string view;
    string[string] config;
    string request;
    string formBuilder;
    string[string] availableFieldTypes;



}
