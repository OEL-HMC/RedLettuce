component output="false" accessors="false" extends="BaseCommandTest"
{

    function beforeAll(){

        super.beforeAll();

        variables.rd = createUUID();

        var setResult = new redis.commands.Set().execute( redisClient, rd, "This is a string" );

    }

    function afterAll(){
        var delResult = new redis.commands.Del().execute( redisClient, rd );
        super.afterAll();
    }

    function run(){


        describe(
            "GetRange Tests Based on Redis documentation samples : https://redis.io/commands/getrange",
            function(){
                it(
                    "Range on 'this is a string' with values 0,3 ==> This",
                    function(){
                        var gg = new redis.commands.GetRange().execute( redisClient, rd, 0, 3 );
                        expect( gg ).toBe( "This" );                
                    }
                );

                it("Range on 'this is a string' with values -3,-1 ==> ing",
                    function(){
                        var gg = new redis.commands.GetRange().execute( redisClient, rd, -3, -1 );
                        expect( gg ).toBe( "ing" );               
                    }
                );

                it("Range on 'this is a string' with values 0,-1 ==> This is a string",
                    function(){
                        var gg = new redis.commands.GetRange().execute( redisClient, rd, 0, -1 );
                        expect( gg ).toBe( "This is a string" );   
                    }
                );

                it("Range on 'this is a string' with values 10,100 ==> string",
                    function(){
                        var gg = new redis.commands.GetRange().execute( redisClient, rd, 10, 100 );
                        expect( gg ).toBe( "string" );   
                    }
                );
                
                it("Range on 'this is a string' with values 100,150 ==> ''",
                    function(){
                        var gg = new redis.commands.GetRange().execute( redisClient, rd, 100, 150 );
                        expect( gg ).toBe( "" );   
                    }
                );

                it("Range on 'this is a string' with values -1,-5 ==> ''",
                    function(){
                        var gg = new redis.commands.GetRange().execute( redisClient, rd, -1, -5 );
                        expect( gg ).toBe( "" );   
                    }
                );
            }
        );

    }

}