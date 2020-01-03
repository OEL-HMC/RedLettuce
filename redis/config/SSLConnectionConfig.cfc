component accessors="false" output="false"  extends="RedisConnectionConfig" {

    public SSLConnectionConfig function init(){

        super.init();

        variables.connectionType = "SSL";

        return this;
    }
    
   	public boolean function isSSL(){
		
		return false;
	}

}