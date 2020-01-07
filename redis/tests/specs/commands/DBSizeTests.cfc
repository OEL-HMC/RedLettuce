component extends="BaseCommandTest" output="false" accessors="true" hint="Returns the number of keys in the selected database"
{

    function run(){

         

        describe(
            "DBSize Tests",
            function(){

                it(
                    "Get the dbsize before and after adding ONE key : check the diff == 1",
                    function(){

                        

                        var uid = createUUID();



                        var num1 = new redis.commands.DbSize().execute( redisClient );

                        var ins = new redis.commands.Set().execute( redisClient, uid, "BLABLA", "nx" );

                        expect( ins ).toBE("OK");

                        var num2 = new redis.commands.DbSize().execute( redisClient );

                        expect( num2-num1 ).toBe(1);

                        var ins = new redis.commands.Del().execute( redisClient, uid);

                    }
                );

            }
        );


    }


}