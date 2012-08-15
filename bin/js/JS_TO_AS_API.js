/**
 * ...
 * @author Christian Dewinetz
 
 These functions define the API available - in the SWF - to call from the HTML page (via JS)
 */

var JS_TO_AS_API={
	DEFAULT_MOVIE_ID:"LEARNSWF",
	printFrame:function(){
		var movie=JS_TO_AS_API.getMovie(null);
		try{
			movie.printFrame();
		}catch(err){
			alert("Cannot call AS method: printFrame. "+err.message);
		}
	},
	saveNotes:function(notes){
		var movie=JS_TO_AS_API.getMovie(null);
		try{
			movie.saveNotes(notes);
		}catch(err){
			alert("Cannot call AS method: saveNotes. "+err.message);
		}
	},
	startClip:function(){
		var movie=JS_TO_AS_API.getMovie(null);
		try{
			movie.startClip();
		}catch(err){
			alert("Cannot call AS method: startClip. "+err.message);
		}
	},
	getMovie:function(id){
		/*  This method's mechanics will depend on the embedding method used
		*/
		
		var movie;
		if(id==null || id=="" || typeof(id)==undefined){
			movie=document.getElementById(JS_TO_AS_API.DEFAULT_MOVIE_ID);
		}else{
			movie=document.getElementById(id);
		}
		return movie;
	},
};