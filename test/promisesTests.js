var Q = require("q");
var fs = require("fs");


function testPromise(value)
{
  return Q.fcall(function(){

    if (value == 0)
      return "rafael.sousa";

     throw new Error("Cant do it.");
  });
}

function testPromise2()
{
  var deferred = Q.defer();
  fs.readFile("foo.txt", "utf-8", function (error, text) {
      if (error) {
          deferred.reject(new Error(error));
      } else {
          deferred.resolve(text);
      }
  });
  return deferred.promise;
}

function testPromise3(){

  var deferred = Q.defer();

  setTimeout(function(){

      deferred.reject(new Error("Delayed Error"));
    },1000);

  return deferred.promise;
};

testPromise(0)
.then(function(result){

  console.log(result);
})
.fail(function(e){

  console.log(e);
});

testPromise2()
.then(function(data){

  console.log(data);
})
.fail(function(err){

  console.log(err);
});

testPromise3()
.then(function(data){

  console.log(data);
})
.fail(function(err){

  console.log(err);
});
