component extends="testbox.system.BaseSpec"{

		function beforeAll(){
			
		}

        function run(){
        

            describe(
                "Testing base configuration",
                function(){
                    it(
                    	"create an connection with an empty struct throws an error",
                    	function(){
                    		var config = new redis.config.ConnectionConfigBuilder();
							
							var errCode = 0;

							try{
								config.fromStruct( {} );
							}
							catch( Redis e){
								errCode = 1;
							} 
							catch( any e ){
								
								errCode = 2;
							}

							expect( errCode ).toBe(1);

                    	}
					);
					
					it(
                    	"create an connection with an struct containg bad value for 'type' throws an error",
                    	function(){
                    		var config = new redis.config.ConnectionConfigBuilder();
							
							var errCode = 0;

							try{
								config.fromStruct( { "type": "BBB" } );
							}
							catch( Redis e){
								errCode = 1;
							} 
							catch( any e ){
								errCode = 2;
							}

							expect( errCode ).toBe(1);

                    	}
					);
					
					it(
                    	"create an REDIS connection with all values empty",
                    	function(){
                    		var builder = new redis.config.ConnectionConfigBuilder();
							
							var errCode = 0;

							try{
								var conf = builder.fromStruct( { "type": "redis" } );
								
							}
							catch( Redis e){
								errCode = 1;
							} 
							catch( any e ){
								writeDump(e);
								errCode = 2;
							}

							expect( errCode ).toBe(0);
							expect( conf.getType() ).toBe("redis");
							expect( conf.getHost() ).toBe("localhost");
							expect( conf.getPort() ).toBe(6379);
							expect( conf.getName() ).toBeNull();
                    	}
					);
					it(
                    	"create an REDIS connection with name",
                    	function(){
                    		var builder = new redis.config.ConnectionConfigBuilder();
							
							var errCode = 0;

							try{
								var conf = builder.fromStruct( { "type": "redis", "name": "clientName" } );
							}
							catch( Redis e){
								errCode = 1;
							} 
							catch( any e ){
								errCode = 2;
							}

							expect( errCode ).toBe(0);
							expect( conf.getType() ).toBe("redis");
							expect( conf.getHost() ).toBe("localhost");
							expect( conf.getPort() ).toBe(6379);
							expect( isNull(conf.getName()) ).toBeFalse();
                    	}
					);
					
					it(
                    	"create an REDIS connection with name + host",
                    	function(){
                    		var builder = new redis.config.ConnectionConfigBuilder();
							
							var errCode = 0;

							try{
								var conf = builder.fromStruct( 
									{ "type": "redis", "name": "clientName", "host": "127.0.0.1:8383" } 
								);
							}
							catch( Redis e){
								errCode = 1;
							} 
							catch( any e ){
								errCode = 2;
							}

							expect( errCode ).toBe(0);
							expect( conf.getType() ).toBe("redis");
							expect( conf.getHost() ).toBe("127.0.0.1");
							expect( conf.getPort() ).toBe(8383);
							expect( isNull(conf.getName()) ).toBeFalse();
                    	}
					);
					
					it(
                    	"create an REDIS connection with name + [host]",
                    	function(){
                    		var builder = new redis.config.ConnectionConfigBuilder();
							
							var errCode = 0;

							try{
								var conf = builder.fromStruct( 
									{ "type": "redis", "name": "clientName", "host": ["127.0.0.1:8383"] } 
								);
							}
							catch( Redis e){
								errCode = 1;
							} 
							catch( any e ){
								errCode = 2;
							}

							expect( errCode ).toBe(0);
							expect( conf.getType() ).toBe("redis");
							expect( conf.getHost() ).toBe("127.0.0.1");
							expect( conf.getPort() ).toBe(8383);
							expect( isNull(conf.getName()) ).toBeFalse();
							expect( conf.getName() ).toBe(  "clientName" )  ;
                    	}
					);
					
					it(
                    	"create an REDIS connection with name + [host1, host2] ( takes the last host as only one is allowed )",
                    	function(){
                    		var builder = new redis.config.ConnectionConfigBuilder();
							
							var errCode = 0;

							try{
								var conf = builder.fromStruct( 
									{ "type": "redis", "name": "clientName", "hosts": ["127.0.0.1:8383","127.0.0.2:8484"] } 
								);
							}
							catch( Redis e){
								errCode = 1;
							} 
							catch( any e ){
								errCode = 2;
							}

							expect( errCode ).toBe(0);
							expect( conf.getType() ).toBe("redis");
							expect( conf.getHost() ).toBe("127.0.0.2");
							expect( conf.getPort() ).toBe(8484);
							expect( isNull(conf.getName()) ).toBeFalse();
							expect( conf.getName() ).toBe(  "clientName" )  ;
                    	}
					);
					
					it(
                    	"create an SENTINEL connection with name + [host1, host2] ( getHosts() and getPorts must be used to check values )",
                    	function(){
                    		var builder = new redis.config.ConnectionConfigBuilder();
							
							var errCode = 0;

							try{
								var conf = builder.fromStruct( 
									{ "type": "sentinel", "name": "clientName", "hosts": ["127.0.0.1:8383","127.0.0.2:8484"] } 
								);
							}
							catch( Redis e){
								errCode = 1;
							} 
							catch( any e ){
								writeDump(e);
								errCode = 2;
							}

							expect( errCode ).toBe(0);
							expect( conf.getType() ).toBe("sentinel");
							expect( conf.getHost()[1] ).toBe("127.0.0.1");
							expect( conf.getPorts()[1] ).toBe(8383);
							expect( conf.getHost()[2] ).toBe("127.0.0.2");
							expect( conf.getPorts()[2] ).toBe(8484);
							expect( isNull(conf.getName()) ).toBeFalse();
							expect( conf.getName() ).toBe(  "clientName" )  ;
                    	}
					);
					
					it(
                    	"create an SENTINEL connection with name + [host1:1111, host2:2222, host3] ( Port for 3rd host is empty )",
                    	function(){
                    		var builder = new redis.config.ConnectionConfigBuilder();
							
							var errCode = 0;

							try{
								var conf = builder.fromStruct( 
									{ "type": "sentinel", "name": "clientName", "hosts": ["127.0.0.1:8383","127.0.0.2:8484","127.0.0.3"] } 
								);
							}
							catch( Redis e){
								errCode = 1;
							} 
							catch( any e ){
								writeDump(e);
								errCode = 2;
							}

							expect( errCode ).toBe(0);
							expect( conf.getType() ).toBe("sentinel");
							expect( conf.getHost()[1] ).toBe("127.0.0.1");
							expect( conf.getPorts()[1] ).toBe(8383);
							expect( conf.getHost()[2] ).toBe("127.0.0.2");
							expect( conf.getPorts()[2] ).toBe(8484);
							expect( conf.getHost()[3] ).toBe("127.0.0.3");
							expect( conf.getPorts()[3] ).toBe("");
							expect( isNull(conf.getName()) ).toBeFalse();
							expect( conf.getName() ).toBe(  "clientName" )  ;
                    	}
					);
					
					it(
                    	"create an SSL connection with name + [host1:1111, host2:2222, host3] ( Port for 3rd host is empty, so it takes default port for SSL connection )",
                    	function(){
                    		var builder = new redis.config.ConnectionConfigBuilder();
							
							var errCode = 0;

							try{
								var conf = builder.fromStruct( 
									{ "type": "ssl", "name": "clientName", "hosts": ["127.0.0.1:8383","127.0.0.2:8484","127.0.0.3"] } 
								);
							}
							catch( Redis e){
								errCode = 1;
							} 
							catch( any e ){
								writeDump(e);
								errCode = 2;
							}

							expect( errCode ).toBe(0);
							expect( conf.getType() ).toBe("ssl");
							expect( conf.getHost() ).toBe("127.0.0.3");
							expect( conf.getPorts()[1] ).toBe(6379);
							
							expect( isNull(conf.getName()) ).toBeFalse();
							expect( conf.getName() ).toBe(  "clientName" )  ;
                    	}
					);
					
					it(
                    	"create an SSL connection with name + [host1:1111, host2:2222, host3] ( Port for 3rd host is empty, so it takes default port for SSL connection )",
                    	function(){
                    		var builder = new redis.config.ConnectionConfigBuilder();
							
							var errCode = 0;

							try{
								var conf = builder.fromStruct( 
									{ "type": "ssl", "name": "clientName", "hosts": ["127.0.0.1:8383","127.0.0.2:8484","127.0.0.3:8585"] } 
								);
							}
							catch( Redis e){
								errCode = 1;
							} 
							catch( any e ){
								writeDump(e);
								errCode = 2;
							}

							expect( errCode ).toBe(0);
							expect( conf.getType() ).toBe("ssl");
							expect( conf.getHost() ).toBe("127.0.0.3");
							expect( conf.getPorts()[1] ).toBe(8585);
							
							expect( isNull(conf.getName()) ).toBeFalse();
							expect( conf.getName() ).toBe(  "clientName" )  ;
                    	}
                    );
				}
            );
            
            
            
                                
                    
                    
            
            

            
            
        };

}