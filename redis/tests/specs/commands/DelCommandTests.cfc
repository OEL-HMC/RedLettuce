component extends="BaseCommandTest"{


        function run(){
        

            describe(
                "DEL COMMAND",
                function(){

                    it(
                        "Try to delete an non-existing key. Must return 0", 
                        function(){

                            

                            var res = new redis.commands.Del().execute( redisClient,  ["blabla does not exits"]);

                            expect(res).toBe(0);

                            

                        }
                    );

                    it(
                        "Try to delete all keys starting with 'DEV:'.", 
                        function(){

                            

                            var keysToDelete = new redis.commands.scan(  ).execute(redisClient, "DEV:*");

                            var res = new redis.commands.Del().execute( redisClient,  keysToDelete);

                            if( arrayLen( keysToDelete ) == 0 ){
                                expect( local.res ).toBe(-1);
                            }else{
                                expect( local.res ).toBe( arrayLen( keysToDelete ) );
                            }
                            
                            

                        }
                    );

                }
            );

            

            
            
        };

}