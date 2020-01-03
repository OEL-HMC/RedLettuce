component extends="testbox.system.BaseSpec"{


        function run(){
        

            describe(
                "RedisConnection",
                function(){
                    it(
                        "can compile",
                        function(){
                            expect( isStruct( new redis.config.RedisConnection() ) ).toBeTrue();
                        }
                    );

                    it(
                        "type is redis | localhost | 6379",
                        function(){
                            expect( new redis.config.RedisConnection().getType() ).toBe("redis");
                            expect( new redis.config.RedisConnection().getHost() ).toBe("localhost");
                            expect( new redis.config.RedisConnection().getPort() ).toBe(6379);
                            expect( new redis.config.RedisConnection().getTimeout() ).toBe(60);
                            expect( new redis.config.RedisConnection().getTimeoutUnit() ).toBe("s");
                        }
                    );

                    it(
                        "Set the timeout to 90 nanoSeconds (deprecated since TimeUnit are deprecated in Lettuce)",
                        function(){
                            expect( new redis.config.RedisConnection().timeout( 90, "ns").getTimeout() ).toBe(90);
                            expect( new redis.config.RedisConnection().timeout( 90, "ns").getTimeoutUnit() ).toBe("ns");
                            
                        }
                    );

                    it(
                        "Set the timeout to 100 micro seconds (deprecated since TimeUnit are deprecated in Lettuce)",
                        function(){
                            expect( new redis.config.RedisConnection().timeout( 100, "us").getTimeout() ).toBe(100);
                            expect( new redis.config.RedisConnection().timeout( 100, "us").getTimeoutUnit() ).toBe("us");
                            
                        }
                    );

                    it(
                        "Set the timeout to 110 milli seconds (deprecated since TimeUnit are deprecated in Lettuce)",
                        function(){
                            expect( new redis.config.RedisConnection().timeout( 110, "ms").getTimeout() ).toBe(110);
                            expect( new redis.config.RedisConnection().timeout( 110, "ms").getTimeoutUnit() ).toBe("ms");
                            
                        }
                    );

                    it(
                        "Set the timeout to 120 seconds (deprecated since TimeUnit are deprecated in Lettuce)",
                        function(){
                            expect( new redis.config.RedisConnection().timeout( 120, "s").getTimeout() ).toBe(120);
                            expect( new redis.config.RedisConnection().timeout( 120, "s").getTimeoutUnit() ).toBe("s");
                            
                        }
                    );

                    it(
                        "Set the timeout to 130 minutes (deprecated since TimeUnit are deprecated in Lettuce)",
                        function(){
                            expect( new redis.config.RedisConnection().timeout( 130, "m").getTimeout() ).toBe(130);
                            expect( new redis.config.RedisConnection().timeout( 130, "m").getTimeoutUnit() ).toBe("m");
                            
                        }
                    );

                    it(
                        "Set the timeout to 140 days (deprecated since TimeUnit are deprecated in Lettuce)",
                        function(){
                            expect( new redis.config.RedisConnection().timeout( 140, "d").getTimeout() ).toBe(140);
                            expect( new redis.config.RedisConnection().timeout( 140, "d").getTimeoutUnit() ).toBe("d");
                            
                        }
                    );

                    it(
                        "Set the timeout to 150 hours (deprecated since TimeUnit are deprecated in Lettuce) ",
                        function(){
                            expect( new redis.config.RedisConnection().timeout( 150, "h").getTimeout() ).toBe(150);
                            expect( new redis.config.RedisConnection().timeout( 150, "h").getTimeoutUnit() ).toBe("h");
                            
                        }
                    );


                    it( 
                        "set the host connection.host('192.168.56.10')",
                        function(){
                            expect(
                                new redis.config.RedisConnection().host( "192.168.56.10" ).getHost()
                            ).toBe("192.168.56.10");
                            expect(
                                new redis.config.RedisConnection().host( "192.168.56.10" ).getPort()
                            ).toBe(6379);
                        }
                    );

                    it( 
                        "set the host and port : connection.host('192.168.56.10:27379')",
                        function(){
                            expect(
                                new redis.config.RedisConnection().host( "192.168.56.10:27379" ).getHost()
                            ).toBe("192.168.56.10");
                            expect(
                                new redis.config.RedisConnection().host( "192.168.56.10:27379" ).getPort()
                            ).toBe(27379);
                        }
                    );

                    it(
                        "set the client name : connection.name('cf-redis-connection')",
                        function(){
                            expect( new redis.config.RedisConnection().name('cf-redis-connection').getName()).toBe('cf-redis-connection');
                        }
                    );

                    it(
                        "Build the RedisURI and check default host",
                        function(){
                            expect( new redis.config.RedisConnection().build().getHost() ).toBe('localhost');
                        }
                    );

                    it(
                        "Build the RedisURI and check default port",
                        function(){
                            expect( new redis.config.RedisConnection().build().getPort() ).toBe(6379);
                        }
                    );

                    it(
                        "Build the RedisURI and check with th 60s default timeout",
                        function(){
                            expect( new redis.config.RedisConnection().build().getTimeout().getSeconds() ).toBe(60);
                        }
                    );

                    it(
                        "Build the RedisURI and check with th 60s default timeout",
                        function(){
                            expect( new redis.config.RedisConnection().timeout( 90, "m" ).build().getTimeout().toMinutes() ).toBe(90);
                        }
                    );

                    it(
                        "Build the RedisURI and check name is returned correctly",
                        function(){
                            expect( 
                                new redis.config.RedisConnection().name( "redis-cf-client" ).build().getClientName()
                            ).toBe("redis-cf-client");
                        }
                    );

                    it(
                        "Build a redis client", 
                        function(){

                            var builder = new redis.RedisClientBuilder();
                            var conf = new redis.config.RedisConnection().name( "redis-cf-client" );
                            var redisClient = builder.createRedisClientWithRedisURI( conf );

                            redisClient.shutdown();

                            //expect( isObject( builder.createRedisClientWithRedisURI( conf )  ) ).toBeTrue();




                        }
                    );

                }
            );

            describe(
                "tests for building configuration for redis connection",
                function(){

                    it(
                        "Build an empty conf and check type is 'none'",
                        function(){
                            var conf = new redis.RedisConnectionConfig();
                            expect( conf.getType() ).toBe('standalone');
                        }
                    );

                    it(
                        "Try to set with a wrong type",
                        function(){

                            var errorCaught = false;

                            try{
                                var conf = new redis.RedisConnectionConfig().type("blabla");

                            }catch( REDIS e ){
                                errorCaught = true;
                            }
                            
                            expect( errorCaught ).toBeTrue();
                        }
                    );

                    it(
                        "Try to set with a standalone type",
                        function(){

                            var errorCaught = false;

                            try{
                                var conf = new redis.RedisConnectionConfig().type("standalone");

                            }catch( REDIS e ){
                                errorCaught = true;
                            }
                            
                            expect( errorCaught ).toBeFalse();
                            expect( conf.getType() ).toBe("standalone");
                        }
                    );
                    it(
                        "Try to set with a SSL type",
                        function(){

                            var errorCaught = false;

                            try{
                                var conf = new redis.RedisConnectionConfig().type("ssl");

                            }catch( REDIS e ){
                                errorCaught = true;
                            }
                            
                            expect( errorCaught ).toBeFalse();
                            expect( conf.getType() ).toBe("ssl");
                        }
                    );
                    it(
                        "Try to set with a socket type",
                        function(){

                            var errorCaught = false;

                            try{
                                var conf = new redis.RedisConnectionConfig().type("socket");

                            }catch( REDIS e ){
                                errorCaught = true;
                            }
                            
                            expect( errorCaught ).toBeFalse();
                            expect( conf.getType() ).toBe("socket");
                        }
                    );
                    it(
                        "Try to set with a sentinel type",
                        function(){

                            var errorCaught = false;

                            try{
                                var conf = new redis.RedisConnectionConfig().type("sentinel");

                            }catch( REDIS e ){
                                errorCaught = true;
                            }
                            
                            expect( errorCaught ).toBeFalse();
                            expect( conf.getType() ).toBe("sentinel");
                        }
                    );

                    it(
                        "set a password for the connection",
                        function(){
                            expect( new redis.RedisConnectionConfig().password('toto').getPassword() ).toBe('toto');
                        }
                    );

                    it(
                        "set a port for the connection",
                        function(){
                            expect( new redis.RedisConnectionConfig().port(1).getPort() ).toBe(1);
                        }
                    );

                }
            );
            
        };

}