component {

    this.name = "redis_tests_#hash( getCurrentTemplatePath() )#";
    

    this.javaSettings = {
        "loadPaths": expandPath( "/redis/lib/jars/" ),
        "reloadOnChange": true,
        "watchInterval": 10
    };
    
    
    public any function onRequestStart(){
    
    	//set here for each request just for test. Probably best to set these elsewhere
    
    	request.masterRedis = {
    		"host": "XXX.XXX.XXX.XXX",
    		"port": 6379
    	};
    	
    	request.sentinel = {
    		"master": "redis-cluster", //masterId
    		"hosts":[
    			"XXX.XXX.XXX.XX2:PORT1",//no port set possible
    			"XXX.XXX.XXX.XX2:PORT2",//no port set possible
    			"XXX.XXX.XXX.XX3" //no port set possible
    		]
    	};
    		
    }
    
    


}