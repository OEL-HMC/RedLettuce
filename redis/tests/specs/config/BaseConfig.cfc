component extends="testbox.system.BaseSpec"{

		function beforeAll(){
			
		}

        function run(){
        

            describe(
                "Testing base configuration",
                function(){

                    
                    
                    it(
                    	"Test config type",
                    	function(){
                    		var config = new redis.config.BaseConnectionConfig('base');
                    		expect( config.getType() ).toBe("base");
                    		expect( isNull(config.getDatabase()) ).toBeTrue();		
                    	}
                    );
                    
                    it(
                    	"Test config name",
                    	function(){
                    		var config = new redis.config.BaseConnectionConfig('base').name("my-great-connection");
                    		expect( config.getName() ).toBe("my-great-connection");
                    	}
                    );

					it(
                    	"Test config databaseID (value and type) ",
                    	function(){
                    		var config = new redis.config.BaseConnectionConfig('base').database(1);
                    		expect( config.getDatabase() ).toBe(1);		
                    		expect( config.getDatabase().getClass().getName() ).toBe("java.lang.Integer");		
                    	}
                    );
                    
                    it(
                    	"Test config timeout and default timeoutunit (value and type) ",
                    	function(){
                    		var config = new redis.config.BaseConnectionConfig('base').timeout(60);
                    		
                    		expect( config.getTimeout() ).toBe(60);		
                    		expect( config.getTimeout().getClass().getName() ).toBe("java.lang.Long");
                    		
                    		expect( config.getTimeoutUnit().name() ).toBe("SECONDS");
                    		
                    	}
                    );                    
					
					it(
                    	"Test config timeout and default timeoutunit in minutes (value and type) ",
                    	function(){
                    		var config = new redis.config.BaseConnectionConfig('base').timeout(60, "m");
                    		
                    		expect( config.getTimeout() ).toBe(60);		
                    		expect( config.getTimeout().getClass().getName() ).toBe("java.lang.Long");
                    		
                    		expect( config.getTimeoutUnit().name() ).toBe("MINUTES");
                    		
                    	}
                    );
                    
                    it(
                    	"Test config password",
                    	function(){
                    		var config = new redis.config.BaseConnectionConfig('base').timeout(60, "m").password("blabla");
							
							expect( config.getPassword() ).toBe("blabla")  ;                    		

                    		
                    	}
                    );
                    
                    it(
                    	"Tryign to build a base config throws an error as it is supposed to be used by subcomponents",
                    	function(){
                    		
                    		var errType = "";
                    		
                    		try{
                    			
                    			var config = new redis.config.BaseConnectionConfig('base').timeout(60, "m").build();	
                    		}catch( REDIS e ){
                    			
                    			errType = e.type;
                    			
                    		}catch ( any e ){
                    			
                    			errType = "other";
                    			
                    		}
                    		
                    		expect( errType != "" ).toBeTrue();
                    		expect( errType != "other" ).toBeTrue();
                    		
                    		
                    		
                    		
                    		
                    		
                    	}
                    );
                    
                }
            );
            
            
            
                                
                    
                    
            
            

            
            
        };

}