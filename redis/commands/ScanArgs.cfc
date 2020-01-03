component 
    accessors="false" 
    output="false"
    hint="Component to help creating ScanArgs instance"
{


    /**
    * Creates the scan args with a structure containing 0 to 2 keys : limit and match
    */
    public any function build( struct args = {} ){

        var scanArgs = createObject("java", "io.lettuce.core.ScanArgs").init();

        if( structKeyExists( arguments.args, "limit" ) ){
            scanArgs.limit( javacast("long", arguments.args.limit ) );
        }

        if( structKeyExists( arguments.args, "match" ) ){
            scanArgs.match( arguments.args.match );
        }

        return scanArgs;
    }


}