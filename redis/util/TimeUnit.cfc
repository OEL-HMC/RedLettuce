component singleton accessors="false" output="false" {

    property name="jTimeUnit" type="any";

    public TimeUnit function init(){

        variables.jTimeUnit = createObject("java", "java.util.concurrent.TimeUnit");
        
        return this;
    }

    public any function getTimeUnit( required string unit ){

		//plural
        //days, hours, microseconds, milliseconds, minutes, nanoseconds, seconds
        
        //singular
        //day, hour, microsecond, millisecond, minute, nanosecond, second
        
        //
        //d, h, us, ms, m, ns, s

        switch( arguments.unit ){

			case "day":
            case "days":
            case "d":
                return jTimeUnit.DAYS;
            break;

            case "hour":
            case "hours":
            case "h":
                return jTimeUnit.HOURS;
            break;

			case "minutes":
            case "minute":
            case "m":
                return jTimeUnit.MINUTES;
            break;

			case "second":
            case "seconds":
            case "s":
                return jTimeUnit.SECONDS;
            break;

			case "millisecond":
			case "milliseconds":
            case "milli":
            case "millis":
            case "ms":
                return jTimeUnit.MILLISECONDS;
            break;

			case "us":
			case "micros":
            case "micro":
            case "microseconds":
            case "microsecond":
                return jTimeUnit.MICROSECONDS;
            break;


			case "ns":
            case "nano":
            case "nanos":
            case "nanoseconds":
            case "nanosecond":

                return jTimeUnit.NANOSECONDS;
            break;

        }


    }

}