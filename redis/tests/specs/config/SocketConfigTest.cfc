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
                    		var config = new redis.config.SocketConnectionConfig();
                    		expect( config.getType() ).toBe("socket");
                    		expect( isNull(config.getDatabase()) ).toBeTrue();		
                    	}
                    );
                    
                    it(
                    	"Test config name",
                    	function(){
                    		var config = new redis.config.SocketConnectionConfig('base').name("my-great-connection");
                    		expect( config.getName() ).toBe("my-great-connection");
                    	}
                    );

					it(
                    	"Test config databaseID (value and type) ",
                    	function(){
                    		var config = new redis.config.SocketConnectionConfig('base').database(1);
                    		expect( config.getDatabase() ).toBe(1);		
                    		expect( config.getDatabase().getClass().getName() ).toBe("java.lang.Integer");		
                    	}
                    );
                    
                    it(
                    	"Test config timeout and default timeoutunit (value and type) ",
                    	function(){
                    		var config = new redis.config.SocketConnectionConfig('base').timeout(60);
                    		
                    		expect( config.getTimeout() ).toBe(60);		
                    		expect( config.getTimeout().getClass().getName() ).toBe("java.lang.Long");
                    		
                    		expect( config.getTimeoutUnit().name() ).toBe("SECONDS");
                    		
                    	}
                    );                    
					
					it(
                    	"Test config timeout and default timeoutunit in minutes (value and type) ",
                    	function(){
                    		var config = new redis.config.SocketConnectionConfig('base').timeout(60, "m");
                    		
                    		expect( config.getTimeout() ).toBe(60);		
                    		expect( config.getTimeout().getClass().getName() ).toBe("java.lang.Long");
                    		
                    		expect( config.getTimeoutUnit().name() ).toBe("MINUTES");
                    		
                    	}
                    );
                    
                    it(
                    	"Test config password",
                    	function(){
                    		var config = new redis.config.SocketConnectionConfig('base').timeout(60, "m").password("blabla");
							
							expect( config.getPassword() ).toBe("blabla")  ;                    		

                    		
                    	}
					);
					

					
                    		
					it(
							"Check host and port and port are set accordingly",
							function(){
								
								
								
								var config = new redis.config.SocketConnectionConfig('base').path('/redis/socket');	
								
								
								expect( config.getPath() ).toBe('/redis/socket');
							}
					);

                    
                    it(
                    	"Tryign to build a base config throws an error as it is supposed to be used by subcomponents",
                    	function(){
                    		
                    		var errType = "";
                    		
                    		try{
                    			
								var config = new redis.config.SocketConnectionConfig('base').timeout(60, "m")
									.path("bloublou")
									.build();	
                    		}catch( REDIS e ){
                    			
                    			errType = e.type;
                    			
                    		}catch ( any e ){
								errType = "other";
								
								writeDump(e);
								abort;
                    			
							}
							
                    		expect( errType != "" ).toBeFalse();
							expect( errType != "other" ).toBeTrue();
							
							expect( config.getClass().getName() ).toBe("io.lettuce.core.RedisURI");
							expect( config.getSocket() ).toBe("bloublou");
							
							expect( config.getTimeout().getSeconds() ).toBe(3600);
							expect( isNull(config.getPassword()) ).toBeTrue();
                    	}
                    );
                    
                }
            );
            
            
            
                                
                    
                    
            
            

            
            
        };

}