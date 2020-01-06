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
                    		var config = new redis.config.SentinelConnectionConfig();
                    		expect( config.getType() ).toBe("sentinel");
                    		expect( isNull(config.getDatabase()) ).toBeTrue();		
                    	}
                    );
                    
                    it(
                    	"Test config name",
                    	function(){
                    		var config = new redis.config.SentinelConnectionConfig('base').name("my-great-connection");
                    		expect( config.getName() ).toBe("my-great-connection");
                    	}
                    );

					it(
                    	"Test config databaseID (value and type) ",
                    	function(){
                    		var config = new redis.config.SentinelConnectionConfig('base').database(1);
                    		expect( config.getDatabase() ).toBe(1);		
                    		expect( config.getDatabase().getClass().getName() ).toBe("java.lang.Integer");		
                    	}
                    );
                    
                    it(
                    	"Test config timeout and default timeoutunit (value and type) ",
                    	function(){
                    		var config = new redis.config.SentinelConnectionConfig('base').timeout(60);
                    		
                    		expect( config.getTimeout() ).toBe(60);		
                    		expect( config.getTimeout().getClass().getName() ).toBe("java.lang.Long");
                    		
                    		expect( config.getTimeoutUnit().name() ).toBe("SECONDS");
                    		
                    	}
                    );                    
					
					it(
                    	"Test config timeout and default timeoutunit in minutes (value and type) ",
                    	function(){
                    		var config = new redis.config.SentinelConnectionConfig('base').timeout(60, "m");
                    		
                    		expect( config.getTimeout() ).toBe(60);		
                    		expect( config.getTimeout().getClass().getName() ).toBe("java.lang.Long");
                    		
                    		expect( config.getTimeoutUnit().name() ).toBe("MINUTES");
                    		
                    	}
                    );
                    
                    it(
                    	"Test config password",
                    	function(){
                    		var config = new redis.config.SentinelConnectionConfig('base').timeout(60, "m").password("blabla");
							
							expect( config.getPassword() ).toBe("blabla")  ;                    		

                    		
                    	}
					);
					                    		
					it(
							"Check host and port and port are set accordingly",
							function(){
								
								
								
								var config = new redis.config.SentinelConnectionConfig('base').host('blabla:1717');	
								
								
								expect( config.getHost()[1] ).toBe('blabla');
								expect( config.getPorts()[1] ).toBe(1717);
								expect( config.getPorts()[1].getClass().getName() ).toBe("java.lang.Integer");

								config.build();
							}
					);

					
                    
                    it(
                    	"Tryign to build a base config throws an error as it is supposed to be used by subcomponents",
                    	function(){
                    		
                    		var errType = "";
                    		
                    		try{
                    			
								var config = new redis.config.SentinelConnectionConfig('base').timeout(60, "m")
									.host("bloublou:1616")
									.host('blabla:1717') //sentinel
									.build();	
                    		}catch( REDIS e ){
                    			
                    			errType = e.type;
                    			
                    		}catch ( any e ){
								errType = "other";
                    		}
                    		
                    		expect( errType != "" ).toBeFalse();
							expect( errType != "other" ).toBeTrue();
							
							expect( config.getClass().getName() ).toBe("io.lettuce.core.RedisURI");

							expect( config.getSentinels()[1].getHost() ).toBe("bloublou");
							expect( config.getSentinels()[1].getPort() ).toBe(1616);

							expect( config.getSentinels()[2].getHost() ).toBe("blabla");
							expect( config.getSentinels()[2].getPort() ).toBe(1717);

							expect( config.getTimeout().getSeconds() ).toBe(3600);
							expect( isNull(config.getPassword()) ).toBeTrue();
                    	}
                    );
                    
                }
            );
            
            
            
                                
                    
                    
            
            

            
            
        };

}